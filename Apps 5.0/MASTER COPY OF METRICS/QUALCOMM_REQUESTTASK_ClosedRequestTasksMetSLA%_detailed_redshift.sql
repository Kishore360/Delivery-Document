select 'Closed Request Tasks - Met SLA %'as Metric_Name,x/cnt firs from (
(select  count(a.*) x
from ldb.f_request_task_closed a
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
 where met_sla_flag='Y' and A14.lagging_count_of_months between 0 and 11
)a
cross join 
(select count(a.*) as cnt
from ldb.f_request_task_closed a
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
 where  A14.lagging_count_of_months between 0 and 11
)b)c