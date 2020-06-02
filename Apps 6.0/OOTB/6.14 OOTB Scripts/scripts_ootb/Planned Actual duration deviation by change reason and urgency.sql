select reason, urgency,approval, ''as metrics, opened_changes, 

cast(round(coalesce(planned_duration,0),1) as varchar(200)) as planned_duration,
cast(round(coalesce(actual_duration,0),1) as varchar(200)) as actual_duration,
-- lag_count,
case when planned_duration-actual_duration < 0 
then '(' || cast(
round(coalesce(actual_duration,0)-coalesce(planned_duration,0),1) 
as varchar(200)) || ')'  
else  cast(
round(coalesce(planned_duration,0)-coalesce(actual_duration,0),1) 
as varchar(200))
end as deviation_duration -- ,planned_duration_30,actual_duration_30,lag_count
,case when planned_duration_30-actual_duration_30 < 0  
then '(' || cast(
round(((coalesce(actual_duration_30 ,0)-(coalesce(planned_duration_30,0)))/lag_count ),1)
as varchar(200)) || ')'  
else  cast(
round(((coalesce(planned_duration_30,0)-coalesce(actual_duration_30,0))/lag_count ),1)
as varchar(200))
end as avg_deviation_duration
from (
select changereason.dimension_name as reason, lov_urg.dimension_name as urgency,
lov_app.dimension_name as approval,
'' as metrics, 
count(fcr.change_request_key) as opened_changes,
sum((convert(decimal(22,8),fcr.planned_duration))/86400) as planned_duration,
sum((convert(decimal(22,8),fcr.actual_duration))/86400) as actual_duration
,
sum(case when cal.lagging_count_of_days between 0 and 29 then(convert(decimal(22,8),fcr.planned_duration))
else 0 end /86400) as planned_duration_30
,sum(case when cal.lagging_count_of_days between 0 and 29 then(convert(decimal(22,8),fcr.actual_duration))
else 0 end /86400)  as actual_duration_30
, sum(case when cal.lagging_count_of_days between 0 and 29 then 1 else null end) as lag_count
-- select count(fcr.change_request_key) as opened_changes
from  #DWH_TABLE_SCHEMA.f_change_request fcr
join  #DWH_TABLE_SCHEMA.d_change_request dcr 
   on dcr.row_key=fcr.change_request_key
   and fcr.soft_deleted_flag <> 'Y'
join  #DWH_TABLE_SCHEMA.d_calendar_date cal 
   on (cal.row_key = fcr.opened_on_key
   and cal.lagging_count_of_month between 0 and 12)
join  (   SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
     WHERE lov.dimension_class::text = 'REASON~CHANGE_REQUEST'::text OR lov.row_key = -1 OR lov.row_key = 0
  ) changereason
   on fcr.reason_src_key = changereason.row_key
join  #DWH_TABLE_SCHEMA.d_lov lovstate
   on fcr.state_src_key=lovstate.row_key
join  #DWH_TABLE_SCHEMA.d_lov_map lovmapstate
   on lovmapstate.src_key=lovstate.row_key
 join  ( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
  LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
     AND br.dimension_class::text = 'URGENCY~CHANGE_REQUEST'::text
  UNION 
  SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0
  ) lov_urg
on fcr.urgency_src_key=lov_urg.row_key
join  ( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
  LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
     AND br.dimension_class::text = 'IMPACT~CHANGE_REQUEST'::text
  UNION 
  SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0
  ) lov_imp
on fcr.impact_src_key=lov_imp.row_key
 
 join  ( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
  LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
     AND br.dimension_class::text = 'APPROVAL~CHANGE_REQUEST'::text
  UNION 
  SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0
  ) lov_app
on fcr.approval_state_src_key=lov_app.row_key
join  ( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
  LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
     AND br.dimension_class::text = 'PRIORITY~CHANGE_REQUEST'::text
  UNION 
  SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0
  ) lov_pri
on fcr.priority_src_key=lov_pri.row_key
 join  ( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
  LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
     AND br.dimension_class::text = 'STATE~CHANGE_REQUEST'::text
  UNION 
  SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0
  ) lov_sta
on fcr.state_src_key=lov_sta.row_key

join  ( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
  LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
     AND br.dimension_class::text = 'TYPE~CHANGE_REQUEST'::text
  UNION 
  SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0
  ) lov_typ
on fcr.type_src_key=lov_typ.row_key
    join #DWH_TABLE_SCHEMA.d_internal_contact a12
   on  (fcr.opened_by_key = a12.row_key)
    join 
   (select * from
   #DWH_TABLE_SCHEMA.d_internal_organization 
 where  department_flag = 'Y'::bpchar OR
   row_key = 0 OR row_key = -1
   )  de
   on a12.department_key=de.row_key
--where lovmapstate.dimension_wh_code in ('CLOSED')
group by changereason.dimension_name, lov_urg.dimension_name,lov_app.dimension_name
order by changereason.dimension_name, lov_urg.dimension_name,lov_app.dimension_name);
