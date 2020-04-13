select 'ldb.f_caused_by_change a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_caused_by_change_incident a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_caused_by_change_incident a13
on (a11.incident_caused_by_change_key = a13.row_key)
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
left outer join ldb.d_calendar_month a15
on (a12.month_start_date_key = a15.row_key)
union
select 'ldb.d_incident_application a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
left outer join ldb.d_incident_application a16
on (a11.incident_application_key = a16.row_key)
union
select 'ldb.d_incident_assignment_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
left outer join ldb.d_incident_assignment_group a17
on (a11.incident_assignment_group_key = a17.row_key)