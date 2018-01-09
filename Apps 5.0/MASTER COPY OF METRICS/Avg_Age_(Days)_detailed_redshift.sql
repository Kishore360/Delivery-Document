
select a.x/b.y from
(select (sum(a11.age)/86400.0) as x
from ldb. f_request_item a11
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 12	)a
cross join 
(select count(a11.row_key) as y 
from ldb. f_request_item a11
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
WHERE a15.lagging_count_of_month between 0 and 12	)b