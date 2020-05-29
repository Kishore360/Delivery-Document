select month_name1, scope, impact,''as metrics, closed_changes, successful_changes, unsuccessful_changes
from (
select concat(concat(cal.month_name_abbreviated, ' '), cal.year_id) as  month_name1,

cal.month_id, cal.month_name, changescope.dimension_name as scope, lov_imp.dimension_name as impact,
count(fcr.change_request_key) as closed_changes,
sum(case when dcr.failure_flag <> 'Y' then 1 else 0 end ) as successful_changes,
sum(case when dcr.failure_flag = 'Y' then 1 else 0 end ) as unsuccessful_changes
from #DWH_TABLE_SCHEMA.f_change_request fcr
join #DWH_TABLE_SCHEMA.d_change_request dcr 
	  on dcr.row_key=fcr.change_request_key
	  and fcr.soft_deleted_flag<>'Y'
join #DWH_TABLE_SCHEMA.d_calendar_date cal 
	 on (cal.row_key = fcr.closed_on_key
	 and cal.lagging_count_of_month between 0 and 12)
join #DWH_TABLE_SCHEMA.d_lov lov 
	  on fcr.state_src_key=lov.row_key
join #DWH_TABLE_SCHEMA.d_lov_map lovmap 
	  on lovmap.src_key=lov.row_key
join  (	  SELECT lov.* FROM #DWH_TABLE_SCHEMA.d_lov lov
 		  WHERE lov.dimension_class::text = 'SCOPE~CHANGE_REQUEST'::text OR lov.row_key = -1 OR lov.row_key = 0
		) changescope
		on fcr.scope_src_key = changescope.row_key
join  (	SELECT  lov.*   FROM #DWH_TABLE_SCHEMA.d_lov lov
		LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
  		JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key 
   		AND br.dimension_class::text = 'IMPACT~CHANGE_REQUEST'::text
		UNION 
		SELECT lov.* FROM #DWH_TABLE_SCHEMA.d_lov lov
  		WHERE lov.row_key = -1 OR lov.row_key = 0
		) lov_imp
		on fcr.impact_src_key = lov_imp.row_key
		
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

where lovmap.dimension_wh_code = 'CLOSED'
group by cal.month_id, cal.month_name, changescope.dimension_name, lov_imp.dimension_name
,cal.month_name_abbreviated, cal.year_id
order by cal.month_id, cal.month_name,cal.month_name_abbreviated, cal.year_id, changescope.dimension_name,  case when lov_imp.dimension_name='UNKNOWN' then '0' 
when lov_imp.dimension_name ='UNSPECIFIED' then '0'
else lov_imp.dimension_name end);
