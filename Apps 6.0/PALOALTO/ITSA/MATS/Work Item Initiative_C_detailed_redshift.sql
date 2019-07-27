select 'ldb.f_initiative_fact_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
union
select 'ldb.d_work_item_initiative_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_work_item_initiative_c a12 
on (a11.work_item_initiative_c_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_date_fiscal a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date_fiscal a16 
on (a11.fiscal_date_key_c = a16.row_key) 
union
select 'ldb.d_calendar_week a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_week a17 
on (a13.week_start_date_key = a17.row_key) 
union
select 'ldb.d_calendar_fiscal_period a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date_fiscal a16 
on (a11.fiscal_date_key_c = a16.row_key) 
join ldb.d_calendar_fiscal_period a18 
on (a16.period_start_date_key = a18.row_key) 
union
select 'ldb.d_initiative_business_value_category_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_work_item_initiative_c a12 
on (a11.work_item_initiative_c_key = a12.row_key) 
join ldb.d_initiative_business_value_category_c a19 
on (a12.initiative_business_value_category_key_c = a19.row_key) 
union
select 'ldb.d_initiative_health_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_work_item_initiative_c a12 
on (a11.work_item_initiative_c_key = a12.row_key) 
join ldb.d_initiative_health_c a110 
on (a12.initiative_health_key_c = a110.row_key) 
union
select 'ldb.d_initiative_methdology_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_work_item_initiative_c a12 
on (a11.work_item_initiative_c_key = a12.row_key) 
join ldb.d_initiative_methdology_c a111 
on (a12.initiative_methdology_key_c = a111.row_key) 
union
select 'ldb.d_initiative_phase_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_work_item_initiative_c a12 
on (a11.work_item_initiative_c_key = a12.row_key) 
join ldb.d_initiative_phase_c a112 
on (a12.initiative_phase_key_c_key = a112.row_key) 
union
select 'ldb.d_initiative_size_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_work_item_initiative_c a12 
on (a11.work_item_initiative_c_key = a12.row_key) 
join ldb.d_initiative_size_c a113 
on (a12.initiative_size_key_c = a113.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date_fiscal a16 
on (a11.fiscal_date_key_c = a16.row_key) 
join ldb.d_calendar_fiscal_quarter a114 
on (a16.quarter_start_date_key = a114.row_key) 
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
join ldb.d_calendar_year a115 
on (a15.year_start_date_key = a115.row_key) 
union
select 'ldb.d_calendar_fiscal_year a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_initiative_fact_c a11 
join ldb.d_calendar_date_fiscal a16 
on (a11.fiscal_date_key_c = a16.row_key) 
join ldb.d_calendar_fiscal_year a116 
on (a16.year_start_date_key = a116.row_key) 
