
select '% Change in Avg Request Task Open to Close Duration Since Last 30 Days',((d.firs-d1.sec)/d1.sec)*100.00 from 
(select x/cnt firs from (
(select sum(open_to_close_duration/86400) as x
from ldb.f_request_task_closed a
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
 where A14.lagging_count_of_days between 0 and 29
)a
cross join 
(select count(a.*) as cnt
from ldb.f_request_task_closed a
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
 where  A14.lagging_count_of_days between 0 and 29
)b)c)d
cross join 
(select y/cnt1 sec from (
(select sum(open_to_close_duration/86400) as y
from ldb.f_request_task_closed a
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
 where a15.lagging_count_of_days between 30 and 59
)a1
cross join 
(select count(a.*) as cnt1
from ldb.f_request_task_closed a
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
 where  a15.lagging_count_of_days between 30 and 59
)b1)c1)d1