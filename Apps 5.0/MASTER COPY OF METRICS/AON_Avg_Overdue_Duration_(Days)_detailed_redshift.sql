
select (sum(a11.overdue_duration)/86400.0) /count(a11.row_key)
from ldb. f_request_item a11
join ldb.d_request_item a12
on a11.request_item_key=a12.row_key
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 12 and a12.over_due_flag='Y'