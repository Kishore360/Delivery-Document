select  a11.repair_duration_c as value, median((a11.repair_duration_c) ) over () from 
( select top 10 repair_duration_c from ldb.f_incident where repair_duration_c is not NULL )a11 group by 1

select  a11.repair_duration_c as value, median((a11.repair_duration_c) ) over () from 
( select repair_duration_c from ldb.f_incident )a11 group by 1

select
* from
(
select a12.incident_number as x,--a11.repair_duration_c,
sum(a11.repair_duration_c/60.0) as time_to_repair,
--sum(a11.repair_duration_c/60.0 )as value, 
median(sum((a11.repair_duration_c)/60.0 )) over (partition by a12.incident_number) as median_time_to_repair
from 
 ldb.f_incident a11 
 join ldb.d_incident a12
    on (a11.incident_key = a12.row_key)
 join ldb.d_calendar_date a111
   on  (a11.opened_on_key = a111.row_key)
join ldb.d_calendar_month a112
   on  (a111.month_start_date_key = a112.row_key)
where a112.lagging_count_of_month between 0 and 11 --and  a12.incident_number='INC0246120'
 
group by 1)a
where a.time_to_repair<>a.median_time_to_repair
