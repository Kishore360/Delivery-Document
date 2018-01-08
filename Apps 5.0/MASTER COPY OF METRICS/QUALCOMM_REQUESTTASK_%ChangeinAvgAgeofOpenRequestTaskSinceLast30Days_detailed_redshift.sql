select '% Change in Avg Age of Open Request Task Since Last 30 Days',((age/cnt)*100.0) as percent
(select sum(age/86400) as age
from ldb.f_request_task a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where backlog_flag='Y' and a15.lagging_count_of_days between 0 and 29)a
cross join 
(select count(a.*) as cnt
from ldb.f_request_task a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where backlog_flag='Y' and a15.lagging_count_of_days between 0 and 29)b;