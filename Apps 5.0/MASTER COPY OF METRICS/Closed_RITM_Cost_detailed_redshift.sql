
select (sum(a11.price)/count(a11.row_key))*sum(a11.quantity)
from ldb. f_request_item_closed a11
join ldb.d_request_item a12
on a11.request_item_key=a12.row_key
join ldb.d_calendar_date       a15
on (a11.closed_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 12