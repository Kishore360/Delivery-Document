select a14.month_name as Table_Name, count(1) as Row_Count
from ldb.f_request_closed a
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
                       join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11
group by 1 having count(1)<(
select  avg(cnt) from(
select a14.month_name, count(1) as cnt
from ldb.f_request_closed a
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
                       join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where  a15.lagging_count_of_month between 0 and 11
group by 1)a);