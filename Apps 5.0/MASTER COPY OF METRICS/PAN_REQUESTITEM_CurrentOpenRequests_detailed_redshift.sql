select  'Current Open Requests'as Metric_Name, count(1)
from ldb.f_request_item a
join ldb.d_request_item_state b on a.state_src_key=b.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where wh_dimension_name='OPEN' and  a15.lagging_count_of_month between 0 and 11;