
select change_request_number,actual_end_date,approved_date,closed_on,metrics,closed_changes from (
select dcr.change_request_number,
-- dcr.source_url, 
TO_CHAR(dcr.work_end_on ,'fmMM/fmDD/fmYYYY fmHH12:MI:SS AM') as actual_end_date, 
TO_CHAR(dcr.approval_on ,'fmMM/fmDD/fmYYYY fmHH12:MI:SS AM') as approved_date, 
TO_CHAR(dcr.closed_on ,'fmMM/fmDD/fmYYYY fmHH12:MI:SS AM') as closed_on,
'' as metrics, 
count(fcr.change_request_key) as closed_changes
from  #DWH_TABLE_SCHEMA.f_change_request fcr
join  #DWH_TABLE_SCHEMA.d_change_request dcr
         on dcr.row_key=fcr.change_request_key
         and fcr.soft_deleted_flag <> 'Y'
join  #DWH_TABLE_SCHEMA.d_calendar_date cal
         on (cal.row_key = fcr.closed_on_key
         and cal.lagging_count_of_month between 0 and 12)
		 join #DWH_TABLE_SCHEMA.d_lov lovstate
	  on fcr.state_src_key=lovstate.row_key
join #DWH_TABLE_SCHEMA.d_lov_map lovmapstate
	  on lovmapstate.src_key=lovstate.row_key
where lovmapstate.dimension_wh_code = 'CLOSED'
group by
dcr.change_request_number, actual_end_date, approved_date, closed_on
order by 
dcr.change_request_number, actual_end_date, approved_date, closed_on

)