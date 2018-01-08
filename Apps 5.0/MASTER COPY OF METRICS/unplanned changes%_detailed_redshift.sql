SELECT 
'unplanned_changes',
a.unplanned_changes/b.opened_changes*100.0 as unplanned_changes_percent
FROM 
(
select   count(1) *1.0 unplanned_changes
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		where unplanned_flag='Y' and   a15.lagging_count_of_month between 0 and 11

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
		