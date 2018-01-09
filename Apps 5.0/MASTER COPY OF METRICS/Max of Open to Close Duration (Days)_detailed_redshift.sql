select max(a11.open_to_close_duration)/86400.0
from ldb. f_request_item_closed a11
join ldb.d_calendar_date       a15
on (a11.closed_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 12	