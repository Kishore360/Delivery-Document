SELECT 
'closed_emergency',
a.closed_emergency/b.opened_changes*100.0 as closed_emergency_changes_percent
FROM 
(
select   count(1) closed_emergency
from ldb.f_change_request_closed a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. closed_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_state       a119
on (a.state_src_key = a119.row_key)
where emergency_flag='Y' and wh_dimension_name in ('CLOSED') and  a15.lagging_count_of_month between 0 and 11

) a 
CROSS JOIN 
( 
select count(1)*1.0 as opened_changes
from ldb.f_change_request a
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 		where 
    a15.lagging_count_of_month between 0 and 11
)b