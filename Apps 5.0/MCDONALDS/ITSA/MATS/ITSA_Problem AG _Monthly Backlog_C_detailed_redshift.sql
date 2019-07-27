select 'ldb.n_problem_io_snapshot_monthly_c	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_problem_io_snapshot_monthly_c	a11 
union
select 'ldb.d_calendar_month	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_problem_io_snapshot_monthly_c	a11 
join	ldb.d_calendar_month	a12 
on (a11.month_start_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_problem_io_snapshot_monthly_c	a11 
join	ldb.d_internal_organization_group	a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_business_service	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_problem_io_snapshot_monthly_c	a11 
join	ldb.d_business_service	a16 
on (a11.business_service_key = a16.row_key) 
union
select 'ldb.d_grouped_vendor_c	a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_problem_io_snapshot_monthly_c	a11 
join	ldb.d_grouped_vendor_c	a17 
on (a11.grouped_vendor_c_key = a17.row_key) 
union
select 'ldb.d_lov_problem_age_bucket_c	a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_problem_io_snapshot_monthly_c	a11 
join	ldb.d_lov_problem_age_bucket_c	a18 
on (a11.age_key = a18.row_key) 
union
select 'ldb.d_problem_priority	a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_problem_io_snapshot_monthly_c	a11 
join	ldb.d_problem_priority	a19 
on (a11.priority_src_key = a19.row_key) 