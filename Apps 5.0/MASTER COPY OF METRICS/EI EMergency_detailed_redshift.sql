select   (count(1))
from ldb.f_change_request a
join ldb.d_change_request d on d.row_key=a.change_request_key
join   ldb.d_calendar_date  A14
         on   (a.opened_on_key = a14.row_key)
         join ldb.d_calendar_month a15
         on   (a14.month_start_date_key = a15.row_key)
where emergency_ei_c_flag ='Y' and   a15.lagging_count_of_month between 0 and 35;