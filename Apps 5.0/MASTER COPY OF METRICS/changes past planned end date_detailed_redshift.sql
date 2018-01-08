select count(1) from (
select (a.change_request_key, sum(time_past_planned_end_date/86400.00) /count(a.row_key))abc
from ldb.f_change_request a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11 group by 1) where abc>0 ;
