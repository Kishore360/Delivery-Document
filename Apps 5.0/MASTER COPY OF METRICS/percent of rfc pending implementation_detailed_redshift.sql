SELECT 
'percent_pending_impl_changes',
a.pending_impl/b.backlog*100.0 as percent_pending_impl_changes
FROM 
(
select count(1)*1.0 as pending_impl
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 join ldb.d_change_request_approval       a111
on (a.approval_state_src_key = a111.row_key)
 
		where backlog_flag='Y'and a111.wh_dimension_name='APPROVED' and
    a15.lagging_count_of_month between 0 and 11

) a 
CROSS JOIN 
( 
select count(1)
from ldb.f_change_request a
join ldb.d_change_request d on a.change_request_key=d.row_key
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
		 where backlog_flag='Y' AND   a15.lagging_count_of_month between 0 and 11;
)b