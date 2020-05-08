select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_change_request a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
union
select 'ldb.d_calendar_date_fiscal a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_key = a15.row_key) 
union
select 'ldb.d_calendar_fiscal_period a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
join ldb.d_calendar_fiscal_period a16 
on (a13.period_start_date_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_business_service a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
union
select 'ldb.d_change_request_category a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category a110 
on (a11.category_src_key = a110.row_key) 
union
select 'ldb.d_change_request_impact a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_impact a111 
on (a11.impact_src_key = a111.row_key) 
union
select 'ldb.d_change_request_priority a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority a112 
on (a11.priority_src_key = a112.row_key) 
union
select 'ldb.d_change_request_risk a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a113 
on (a11.risk_src_key = a113.row_key) 
union
select 'ldb.d_configuration_item_change_request_service_offering_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item_change_request_service_offering_c a114 
on (a11.service_offering_c_key = a114.row_key) 
union
select 'ldb.d_change_request_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a115 
on (a11.state_src_key = a115.row_key) 
union
select 'ldb.d_change_request_type a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a116 
on (a11.type_src_key = a116.row_key) 
union
select 'ldb.d_calendar_month a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
join ldb.d_calendar_month a117 
on (a14.month_start_date_key = a117.row_key) 
union
select 'ldb.d_change_request_close_code a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_change_request_close_code a118 
on (a12.close_code_src_key = a118.row_key) 
union
select 'ldb.d_calendar_fiscal_week a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
join ldb.d_calendar_fiscal_week a119 
on (a13.week_start_date_key = a119.row_key) 
union
select 'ldb.d_lov_change_request_service_type_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_lov_change_request_service_type_c a120 
on (a12.service_type_src_c_key = a120.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
join ldb.d_calendar_fiscal_quarter a121 
on (a13.quarter_start_date_key = a121.row_key) 
union
select 'ldb.d_calendar_fiscal_year a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date_fiscal a13 
on (a11.fiscal_date_key = a13.row_key) 
join ldb.d_calendar_fiscal_year a122 
on (a13.year_start_date_key = a122.row_key) 
