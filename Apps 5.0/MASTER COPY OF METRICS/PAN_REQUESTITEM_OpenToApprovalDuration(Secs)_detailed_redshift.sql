select  'Open To Approval Duration (Secs)'as Metric_Name, sum(opened_to_approval_duration_c )
from ldb.f_request_item a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11;