select 'ldb.f_hcl_sla_catalog_attained_flag_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hcl_sla_catalog_attained_flag_c a11
union
select 'ldb.d_hcl_sla_catalog_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hcl_sla_catalog_attained_flag_c a11
join ldb.d_hcl_sla_catalog_c a12
on (a11.hcl_sla_catalog_c_key = a12.row_key)
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hcl_sla_catalog_attained_flag_c a11
join ldb.d_calendar_month a13
on (a11.fact_month_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_quarter a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hcl_sla_catalog_attained_flag_c a11
join ldb.d_calendar_month a13
on (a11.fact_month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter a14
on (a13.quarter_start_date_key = a14.row_key)
union
select 'ldb.d_calendar_year a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hcl_sla_catalog_attained_flag_c a11
join ldb.d_calendar_month a13
on (a11.fact_month_start_date_key = a13.row_key) join ldb.d_calendar_quarter a14
on (a13.quarter_start_date_key = a14.row_key)
join ldb.d_calendar_year a15
on (a14.year_start_date_key = a15.row_key)
