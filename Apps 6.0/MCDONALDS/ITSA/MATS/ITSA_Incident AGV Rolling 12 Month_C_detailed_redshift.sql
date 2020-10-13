select 'ldb.n_incident_vdr_io_snapshot_dynamic_monthly_c	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_vdr_io_snapshot_dynamic_monthly_c	a11 
union
select 'ldb.d_internal_contact_group_vendor_name_c	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_vdr_io_snapshot_dynamic_monthly_c	a11 
join	ldb.d_internal_contact_group_vendor_name_c	a12 
on (a11.assigned_to_key = a12.row_key) 
union
select 'ldb.d_calendar_month_rolling_12_c	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_vdr_io_snapshot_dynamic_monthly_c	a11 
join	ldb.d_calendar_month_rolling_12_c	a13 
on (a11.month_start_key = a13.rolling_12_month) 
union
select 'ldb.d_calendar_month	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_vdr_io_snapshot_dynamic_monthly_c	a11 
join	ldb.d_calendar_month_rolling_12_c	a13 
on (a11.month_start_key = a13.rolling_12_month) join	ldb.d_calendar_month_rolling_12_c	a13 
on (a11.month_start_date_key = a13.rolling_12_month) 
join	ldb.d_calendar_month	a14 
on (a13.month_start_date_key = a14.row_key) 
union
select 'ldb.d_calendar_month_rolling_12_c	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_vdr_io_snapshot_dynamic_monthly_c	a11 
join	ldb.d_calendar_month_rolling_12_c	a13 
on (a11.month_start_date_key = a13.rolling_12_month) 
union
select 'ldb.d_internal_contact_group_vendor_name_c	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_vdr_io_snapshot_dynamic_monthly_c	a11 
join	ldb.d_internal_contact_group_vendor_name_c	a14 
on (a11.assignment_gp_vendor_key = a14.row_key) 
union
select 'ldb.d_calendar_month	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_vdr_io_snapshot_dynamic_monthly_c	a11 
join	ldb.d_calendar_month_rolling_12_c	a13 
on (a11.month_start_key = a13.rolling_12_month) join	ldb.d_calendar_month_rolling_12_c	a13 
on (a11.month_start_date_key = a13.rolling_12_month) 
join	ldb.d_calendar_month	a15 
on (a13.month_start_date_key = a15.row_key) 
union
select 'ldb.d_incident_priority	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_incident_vdr_io_snapshot_dynamic_monthly_c	a11 
join	ldb.d_incident_priority	a16 
on (a11.priority_src_key = a16.row_key) 