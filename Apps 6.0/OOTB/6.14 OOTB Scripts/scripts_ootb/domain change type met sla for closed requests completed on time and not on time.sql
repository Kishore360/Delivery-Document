select domain.domain_name,  lov_type.dimension_name, dcr.met_sla_flag, '' as metrics,
count(fcr.change_request_key) as closed_changes,
sum(case when dcr.not_on_time_flag = 'N' then 1 else 0 end ) as changes_completed_on_time,
sum(case when dcr.not_on_time_flag = 'Y' then 1 else 0 end ) as changes_Not_completed_on_time
,(sum(case when dcr.not_on_time_flag = 'Y' and cal.lagging_count_of_days between 0 and 29  then 1 else 0 end ))
/ (sum(case when  cal.lagging_count_of_days between 0 and 29  then 1 else null end )) 
 as per_changes_Not_completed_30days
from #DWH_TABLE_SCHEMA.f_change_request fcr
join #DWH_TABLE_SCHEMA.d_change_request dcr 
   on dcr.row_key=fcr.change_request_key
   and fcr.soft_deleted_flag <> 'Y'
join #DWH_TABLE_SCHEMA.d_calendar_date cal 
   on (cal.row_key = fcr.closed_on_key
   and cal.lagging_count_of_month between 0 and 12)
join #DWH_TABLE_SCHEMA.d_domain domain
   on domain.row_key = fcr.domain_key
join  ( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
  LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
     AND br.dimension_class::text = 'TYPE~CHANGE_REQUEST'::text
  UNION 
  SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0
  ) lov_type

on fcr.type_src_key=lov_type.row_key

 join  ( SELECT  lov.*   FROM  #DWH_TABLE_SCHEMA.d_lov lov
  LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
    JOIN  #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
     AND br.dimension_class::text = 'PRIORITY~CHANGE_REQUEST'::text
  UNION 
  SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov
    WHERE lov.row_key = -1 OR lov.row_key = 0
  ) lov_pri
on fcr.priority_src_key=lov_pri.row_key
 

join #DWH_TABLE_SCHEMA.d_lov lovstate
   on fcr.state_src_key=lovstate.row_key
join #DWH_TABLE_SCHEMA.d_lov_map lovmapstate
   on lovmapstate.src_key=lovstate.row_key
where lovmapstate.dimension_wh_code = 'CLOSED'
group by domain.domain_name, lov_type.dimension_name, dcr.met_sla_flag
order by domain.domain_name,case when lov_type.dimension_name ='UNKNOWN' then '1' else lov_type.dimension_name end , dcr.met_sla_flag