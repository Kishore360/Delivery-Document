select  'Request Task Opened in last 30 days'as Metric_Name,count(a.row_key )
from ldb.f_request_task a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 29;