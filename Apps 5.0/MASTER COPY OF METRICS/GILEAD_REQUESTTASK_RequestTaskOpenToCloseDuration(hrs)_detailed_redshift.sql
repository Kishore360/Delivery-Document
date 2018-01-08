select 'Request Task Open To Close Duration (hrs)'as Metric_Name,  ( sum(open_to_close_duration/86400.00) )
from ldb.f_request_task_closed a
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11;