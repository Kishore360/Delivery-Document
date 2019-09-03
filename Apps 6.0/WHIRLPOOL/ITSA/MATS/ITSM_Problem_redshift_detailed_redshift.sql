select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
union
select 'ldb.d_business_service a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a12 
on (a11.business_service_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_problem a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a15 
on (a11.problem_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_problem_affected_region_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_affected_region_c a19 
on (a11.affected_region_src_c_key = a19.row_key) 
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) 
union
select 'ldb.d_business_service_criticality a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a12 
on (a11.business_service_key = a12.row_key) 
join ldb.d_business_service_criticality a111 
on (a12.criticality_key = a111.row_key) 
union
select 'ldb.d_problem_category_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_category_c a112 
on (a11.category_src_key = a112.row_key) 
union
select 'ldb.d_change_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_change_request a113 
on (a11.change_request_key = a113.row_key) 
union
select 'ldb.d_internal_contact_fin_del_rca_owner_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_fin_del_rca_owner_c a114 
on (a11.fin_del_rca_owner_c_key = a114.row_key) 
union
select 'ldb.d_internal_contact_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a115 
on (a13.row_current_key = a115.row_current_key) 
union
select 'ldb.d_calendar_time_hour a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a116 
on (a14.hour_24_format_num = a116.hour_24_format_num) 
union
select 'ldb.d_problem_impacted_location_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_impacted_location_c a117 
on (a11.impacted_location_c_key = a117.row_key) 
union
select 'ldb.d_problem_item_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_item_c a118 
on (a11.item_src_c_key = a118.row_key) 
union
select 'ldb.d_service_business_service_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_service_business_service_c a119 
on (a11.business_service_c_key = a119.row_key) 
union
select 'ldb.d_problem_impact a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_impact a120 
on (a11.impact_src_key = a120.row_key) 
union
select 'ldb.d_internal_contact_problem_manager_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_problem_manager_c a121 
on (a11.problem_manager_c_key = a121.row_key) 
union
select 'ldb.d_problem_priority a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_priority a122 
on (a11.priority_src_key = a122.row_key) 
union
select 'ldb.d_problem_reported_type a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_reported_type a123 
on (a11.reported_type_src_key = a123.row_key) 
union
select 'ldb.d_problem_state a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_state a124 
on (a11.state_src_key = a124.row_key) 
union
select 'ldb.d_internal_organization_support_vendor_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_support_vendor_c a125 
on (a11.vendor_c_key = a125.row_key) 
union
select 'ldb.d_problem_region_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_region_c a126 
on (a11.lkp_region_c_key = a126.row_key) 
union
select 'ldb.d_problem_subcategory_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_subcategory_c a127 
on (a11.sub_category_src_key = a127.row_key) 
union
select 'ldb.d_configuration_item_server_name_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item_server_name_c a128 
on (a11.fin_sys_srvr_name_c_key = a128.row_key) 
union
select 'ldb.d_problem_type_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_type_c a129 
on (a11.type_src_c_key = a129.row_key) 
union
select 'ldb.d_location_assigned_to a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
join ldb.d_location_assigned_to a130 
on (a16.location_key = a130.row_key) 
union
select 'ldb.d_calendar_month a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_month a131 
on (a17.month_start_date_key = a131.row_key) 