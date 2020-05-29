select changestate.dimension_name as changestate, revstatus.dimension_name as reviewstatus, ''as metrics,
count(fcr.change_request_key) as opened_changes
from #DWH_TABLE_SCHEMA.f_change_request fcr
join #DWH_TABLE_SCHEMA.d_change_request dcr 
	  on dcr.row_key=fcr.change_request_key
	  and fcr.soft_deleted_flag <> 'Y'
join #DWH_TABLE_SCHEMA.d_calendar_date cal 
	  on (cal.row_key = fcr.opened_on_key
	  and cal.lagging_count_of_month between 0 and 12)
join  (	  SELECT lov.* FROM #DWH_TABLE_SCHEMA.d_lov lov
 		  WHERE lov.dimension_class::text = 'STATE~CHANGE_REQUEST'::text OR lov.row_key = -1 OR lov.row_key = 0
		) changestate
on fcr.state_src_key=changestate.row_key
join  (	  SELECT lov.* FROM #DWH_TABLE_SCHEMA.d_lov lov
 		  WHERE lov.dimension_class::text = 'REVIEW_STATUS~CHANGE_REQUEST'::text OR lov.row_key = -1 OR lov.row_key = 0
		) revstatus
on fcr.review_status_src_key = revstatus.row_key
	  
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

-- where lovmapstate.dimension_wh_code in ('CLOSED')
group by changestate.dimension_name, revstatus.dimension_name
order by changestate.dimension_name, revstatus.dimension_name;