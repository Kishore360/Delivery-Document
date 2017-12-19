select 'ldb.f_service_request_c a11 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 
union
select 'ldb.d_calendar_date_fiscal a11 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 
join          ldb.d_calendar_date_fiscal    a14
                  on          (a11.opened_on_key = a14.row_key)
				  union
		select 'ldb.d_calendar_fiscal_quarter a11 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 
join          ldb.d_calendar_date_fiscal    a14
                  on          (a11.opened_on_key = a14.row_key)
join          ldb.d_calendar_fiscal_quarter               a117
                  on          (a14.quarter_start_date_key = a117.row_key)	
		  union
		select 'ldb.d_calendar_fiscal_year a11 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 
join          ldb.d_calendar_date_fiscal    a14
                  on          (a11.opened_on_key = a14.row_key)
join          ldb.d_calendar_fiscal_year               a117
                  on          (a14.year_start_date_key = a117.row_key)				  
				  
union
select 'ldb.d_lov_service_request_agebucket_c  a12 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_lov_service_request_agebucket_c  a12 											
on (a11.age_key = a12.row_key) 											
union											
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_internal_contact a12 											
on (a11.opened_by_key = a12.row_key) 											
union											
select 'ldb.d_internal_contact_employee_type_c a13 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_internal_contact_employee_type_c a13 											
on (a11.opened_by_key = a13.row_key) 											
union											
select 'ldb.d_service_request_c a14 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_service_request_c a14 											
on (a11.service_request_c_key = a14.row_key) 											
union											
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_calendar_date a15 											
on (a11.opened_on_key = a15.row_key) 											
union											
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_internal_organization_group a16 											
on (a11.assignment_group_key = a16.row_key) 											
union											
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_internal_contact_assigned_to a17 											
on (a11.assigned_to_key = a17.row_key) 											
union											
select 'ldb.d_internal_contact_closed_by_c a18 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_internal_contact_closed_by_c a18 											
on (a11.closed_by_key = a18.row_key) 											
union											
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_configuration_item a19 											
on (a11.configuration_item_key = a19.row_key) 											
union											
select 'ldb.d_internal_organization_department a110 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_internal_organization_department a110 											
on (a11.department_key = a110.row_key) 											
union											
select 'ldb.d_internal_contact_opened_by_c a111 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_internal_contact_opened_by_c a111 											
on (a11.opened_by_key = a111.row_key) 											
union											
select 'ldb.d_duration_c a112 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_duration_c a112 											
on (a11.opened_by_employee_duration = a112.duration_c_key) 											
union											
select 'ldb.d_lov_request_item_employee_type_c a113 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_internal_contact_employee_type_c a13 											
on (a11.opened_by_key = a13.row_key) 											
join ldb.d_lov_request_item_employee_type_c a113 											
on (a13.employee_type_c_key = a113.row_key) 											
union											
select 'ldb.d_internal_contact_requestor_c a114 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_internal_contact_requestor_c a114 											
on (a11.requestor_c_key = a114.row_key) 											
union											
select 'ldb.d_internal_contact a115 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_internal_contact a115 											
on (a11.last_resolved_by_key = a115.row_key) 											
union											
select 'ldb.d_flag_c a116 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_flag_c a116 											
on (a11.sd_touch_flag_c_key = a116.row_key) 											
union											
select 'ldb.d_lov_service_request_category_c a117 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_service_request_c a14 											
on (a11.service_request_c_key = a14.row_key) 											
join ldb.d_lov_service_request_category_c a117 											
on (a14.category_src_key = a117.row_key) 											
union											
select 'ldb.d_internal_organization_group_parent_c a118 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_internal_organization_group a16 											
on (a11.assignment_group_key = a16.row_key) 											
join ldb.d_internal_organization_group_parent_c a118 											
on (a16.parent_row_key_c = a118.row_key) 											
union											
select 'ldb.d_lov_service_request_priority_c a119 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_service_request_c a14 											
on (a11.service_request_c_key = a14.row_key) 											
join ldb.d_lov_service_request_priority_c a119 											
on (a14.priority_src_key = a119.row_key) 											
union											
select 'ldb.d_lov_service_request_state_c a120 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_service_request_c a14 											
on (a11.service_request_c_key = a14.row_key) 											
join ldb.d_lov_service_request_state_c a120 											
on (a14.state_src_key = a120.row_key) 											
union											
select 'ldb.d_lov_service_request_subcategory_c a121 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_service_request_c a14 											
on (a11.service_request_c_key = a14.row_key) 											
join ldb.d_lov_service_request_subcategory_c a121 											
on (a14.subcategory_src_key = a121.row_key) 											
union											
select 'ldb.d_lov_service_request_type_c a122 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_service_request_c a14 											
on (a11.service_request_c_key = a14.row_key) 											
join ldb.d_lov_service_request_type_c a122 											
on (a14.type_src_key = a122.row_key) 											
union											
select 'ldb.d_calendar_month a123 ' as Table_name, count(a11.row_key) Row_Count											
from ldb.f_service_request_c a11 											
join ldb.d_calendar_date a15 											
on (a11.opened_on_key = a15.row_key) 											
join ldb.d_calendar_month a123 											
on (a15.month_start_date_key = a123.row_key) 											
