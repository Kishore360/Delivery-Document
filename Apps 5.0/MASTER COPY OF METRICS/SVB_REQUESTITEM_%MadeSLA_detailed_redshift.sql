select '%MadeSLA'as Metric_Name, sum(
case when sum(approval_to_closed_duration_c)<10 or sum(opened_to_approval_duration_c)=10 then count(a.row_key)
else 0 end) /count(a.row_key) as percentmadesla
from ldb.f_request_item_closed_c a
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11;
