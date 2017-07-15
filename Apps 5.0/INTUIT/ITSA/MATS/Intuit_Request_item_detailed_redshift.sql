select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_request_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a12 
on (a11.request_item_key = a12.row_key) 
union
select 'ldb.d_task_contacttype_req_item_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a12 
on (a11.request_item_key = a12.row_key) 
join ldb.d_task_contacttype_req_item_c a13 
on (a12.ritm_reported_type_src_c_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
union
select 'ldb.d_calendar_date_fiscal a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date_fiscal a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.dh_user_group_classification_hierarchy a17 
on (a11.assignment_group_key = a17.user_group_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level1 a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.dh_user_group_classification_hierarchy a17 
on (a11.assignment_group_key = a17.user_group_key) 
join ldb.dh_user_group_classification_hierarchy_level1 a18 
on (a17.user_group_classification_level1 = a18.user_group_level1_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
union
select 'ldb.d_master_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_master_item a110 
on (a11.catalog_item_key = a110.row_key) 
union
select 'ldb.d_internal_organization_group a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a111 
on (a11.assignment_group_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_internal_contact_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a113 
on (a14.row_current_key = a113.row_current_key) 
union
select 'ldb.d_calendar_fiscal_period a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date_fiscal a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_fiscal_period a114 
on (a15.period_start_date_key = a114.row_key) 
union
select 'ldb.d_request a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request a115 
on (a11.request_key = a115.row_key) 
union
select 'ldb.d_sc_req_item_approval a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_approval a116 
on (a11.approval_state_src_key = a116.row_key) 
union
select 'ldb.d_request_item_stage a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_stage a117 
on (a11.stage_src_key = a117.row_key) 
union
select 'ldb.d_request_item_state a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_state a118 
on (a11.state_src_key = a118.row_key) 
union
select 'ldb.d_internal_contact_requested_for a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requested_for a119 
on (a11.requested_for_key = a119.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_task_closed_by a120 
on (a11.closed_by_key = a120.row_key) 
union
select 'ldb.d_internal_contact_manager_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
join ldb.d_internal_contact_manager_c a121 
on (a16.manager_key = a121.row_key) 
union
select 'ldb.d_calendar_month a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_month a122 
on (a19.month_start_date_key = a122.row_key) 
union
select 'ldb.d_calendar_week a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_week a123 
on (a19.week_start_date_key = a123.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date_fiscal a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_fiscal_quarter a124 
on (a15.quarter_start_date_key = a124.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level2 a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.dh_user_group_classification_hierarchy a17 
on (a11.assignment_group_key = a17.user_group_key) join ldb.dh_user_group_classification_hierarchy_level1 a18 
on (a17.user_group_classification_level1 = a18.user_group_level1_key) 
join ldb.dh_user_group_classification_hierarchy_level2 a125 
on (a18.user_group_level2_key = a125.user_group_level2_key) 
union
select 'ldb.d_calendar_quarter a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_quarter a126 
on (a19.quarter_start_date_key = a126.row_key) 
union
select 'ldb.d_calendar_fiscal_year a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date_fiscal a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_fiscal_year a127 
on (a15.year_start_date_key = a127.row_key) 
union
select 'ldb.d_calendar_year a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_year a128 
on (a19.year_start_date_key = a128.row_key) 