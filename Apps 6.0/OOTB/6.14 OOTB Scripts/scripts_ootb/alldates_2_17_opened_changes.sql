select dcr.change_request_number,
TO_CHAR(dcr.work_start_on ,'fmMM/fmDD/fmYYYY fmHH12:MI:SS AM')  as actual_start_date, 
TO_CHAR(dcr.created_on,'fmMM/fmDD/fmYYYY fmHH12:MI:SS AM') as created_date,
TO_CHAR(dcr.expected_start_on,'fmMM/fmDD/fmYYYY fmHH12:MI:SS AM') as expected_start_on,
TO_CHAR(dcr.opened_on,'fmMM/fmDD/fmYYYY fmHH12:MI:SS AM'), 
TO_CHAR(dcr.planned_end_on,'fmMM/fmDD/fmYYYY fmHH12:MI:SS AM'),
TO_CHAR(dcr.planned_start_on,'fmMM/fmDD/fmYYYY fmHH12:MI:SS AM'),
TO_CHAR(dcr.requested_completion_on,'fmMM/fmDD/fmYYYY fmHH12:MI:SS AM'), 
TO_CHAR(dcr.changed_on,'fmMM/fmDD/fmYYYY fmHH12:MI:SS AM'),
''as metrics,
count(fcr.change_request_key) as opened_changes,
round(sum(coalesce(fcr.planned_duration::decimal(22,8),0))/86400,1) as planned_duration
from  #DWH_TABLE_SCHEMA.f_change_request fcr
join  #DWH_TABLE_SCHEMA.d_change_request dcr
         on dcr.row_key=fcr.change_request_key
         and fcr.soft_deleted_flag <> 'Y'
join  #DWH_TABLE_SCHEMA.d_calendar_date cal
         on (cal.row_key = fcr.opened_on_key
        and cal.lagging_count_of_month between 0 and 12)
group by dcr.change_request_number, actual_start_date, created_date, expected_start_on, dcr.opened_on, dcr.planned_end_on,
dcr.planned_start_on, dcr.requested_completion_on, dcr.changed_on
order by dcr.change_request_number,actual_start_date, created_date, expected_start_on, dcr.opened_on, dcr.planned_end_on,
dcr.planned_start_on, dcr.requested_completion_on, dcr.changed_on;

