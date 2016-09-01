 select'f_incident_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed             a11 
 union
 select'd_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed             a11 
join ldb.d_customer         a12
on (a11.customer_key = a12.row_key)
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_closed             a11 
join ldb.d_internal_contact         a12
on (a11.closed_by_key = a12.row_key)
union
select'd_calendar_time' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_closed             a11 
join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
union
select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_closed             a11 
join ldb.d_calendar_date       a14
on (a11.closed_on_key = a14.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_closed             a11
join ldb.d_calendar_date       a14
on (a11.closed_on_key = a14.row_key)
join ldb.d_calendar_month      a15
on (a14.month_start_date_key = a15.row_key)
union
select'd_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_closed             a11 
join ldb.d_incident       a16
on (a11.incident_key = a16.row_key)
