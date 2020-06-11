select -- year_name -- , dimension_name,
location_name,-- ''as metrics,
opened_changes,coalesce(backlog_changes,0) as backlog_changes,coalesce(dormancy_Age,0) as  dormancy_Age,coalesce(avg_dormancy_Age,0) as avg_dormancy_Age
from (
select  -- cal.year_id, cal.year_name-- , changereason.dimension_name,
loc.location_name,
count(fcr.change_request_key) as opened_changes,
count(case when dcr.backlog_flag='Y' then fcr.change_request_key else null end) as backlog_changes,
round(sum( case when dcr.backlog_flag='Y' then fcr.dormancy_age else null end/86400.0),1) as dormancy_Age,
round(sum(case when dcr.backlog_flag='Y' then fcr.dormancy_age else null end/86400.0)/count(case when dcr.backlog_flag='Y' then fcr.change_request_key else null end),1) as avg_dormancy_Age
--sum(case when dcr.unplanned_flag = 'Y' then 1 else 0 end ) as closed_unplanned_changes
-- select count(1)
from  #DWH_TABLE_SCHEMA.f_change_request fcr
join  #DWH_TABLE_SCHEMA.d_change_request dcr 
   on dcr.row_key=fcr.change_request_key
   and fcr.soft_deleted_flag <> 'Y'
join  #DWH_TABLE_SCHEMA.d_calendar_date cal 
   on (cal.row_key = fcr.opened_on_key
   and cal.lagging_count_of_month between 0 and 12)
   join  #DWH_TABLE_SCHEMA.d_location loc 
   on loc.row_key = fcr.location_key
join  #DWH_TABLE_SCHEMA.d_lov lovstate
   on fcr.state_src_key=lovstate.row_key
join  #DWH_TABLE_SCHEMA.d_lov_map lovmapstate
   on lovmapstate.src_key=lovstate.row_key
join  (   SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
     WHERE lov.dimension_class::text = 'REASON~CHANGE_REQUEST'::text OR lov.row_key = -1 OR lov.row_key = 0
  ) changereason
on fcr.reason_src_key = changereason.row_key

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
     AND br.dimension_class::text = 'TYPE~CHANGE_REQUEST'::text
  UNION 
  SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0
  ) lov_typ

on fcr.type_src_key=lov_typ.row_key
-- and dcr.backlog_flag='Y'
--  where fcr.opened_by_key <>-1
group by -- cal.year_id, cal.year_name-- , changereason.dimension_name,
loc.location_name
order by -- cal.year_id, cal.year_name -- , changereason.dimension_name,
loc.location_name
);C