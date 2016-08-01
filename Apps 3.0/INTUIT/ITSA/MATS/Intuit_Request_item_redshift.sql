SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_master_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_master_item a13 
on (a11.catalog_item_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.dh_user_group_classification_hierarchy a15 
on (a11.assignment_group_key = a15.user_group_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level1 a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.dh_user_group_classification_hierarchy a15 
on (a11.assignment_group_key = a15.user_group_key) 
join ldb.dh_user_group_classification_hierarchy_level1 a16 
on (a15.user_group_classification_level1 = a16.user_group_level1_key) 
union
select 'ldb.d_request_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a17 
on (a11.request_item_key = a17.row_key) 
union
select 'ldb.d_calendar_greg_fiscal a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_greg_fiscal a19 
on (a11.opened_on_key = a19.gregorian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_greg_fiscal a19 
on (a11.opened_on_key = a19.gregorian_calendar_key) 
join ldb.d_calendar_date_fiscal a110 
on (a19.fiscal_calendar_key = a110.row_key) 
union
select 'ldb.d_calendar_date a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
union
select 'ldb.d_internal_organization_group a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a112 
on (a11.assignment_group_key = a112.row_key) 
union
select 'ldb.d_configuration_item a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_configuration_item a113 
on (a11.configuration_item_key = a113.row_key) 
union
select 'ldb.d_task_contacttype_req_item_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_task_contacttype_req_item_c a114 
on (a11.reported_type_src_c_key = a114.row_key) 
union
select 'ldb.d_internal_contact_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a115 
on (a12.row_current_key = a115.row_current_key) 
union
select 'ldb.d_request a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request a116 
on (a11.request_key = a116.row_key) 
union
select 'ldb.d_sc_req_item_approval a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_approval a117 
on (a11.approval_state_src_key = a117.row_key) 
union
select 'ldb.d_request_item_stage a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_stage a118 
on (a11.stage_src_key = a118.row_key) 
union
select 'ldb.d_request_item_state a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_state a119 
on (a11.state_src_key = a119.row_key) 
union
select 'ldb.d_internal_contact_requested_for a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requested_for a120 
on (a11.requested_for_key = a120.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_task_closed_by a121 
on (a11.closed_by_key = a121.row_key) 
union
select 'ldb.d_internal_contact_manager_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
join ldb.d_internal_contact_manager_c a122 
on (a14.manager_c_key = a122.row_key) 
union
select 'ldb.d_calendar_fiscal_period a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_greg_fiscal a19 
on (a11.opened_on_key = a19.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a110 
on (a19.fiscal_calendar_key = a110.row_key) 
join ldb.d_calendar_fiscal_period a123 
on (a110.period_start_date_key = a123.row_key) 
union
select 'ldb.d_calendar_month a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_month a124 
on (a111.month_start_date_key = a124.row_key) 
union
select 'ldb.dh_user_group_classification_hierarchy_level2 a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.dh_user_group_classification_hierarchy a15 
on (a11.assignment_group_key = a15.user_group_key) join ldb.dh_user_group_classification_hierarchy_level1 a16 
on (a15.user_group_classification_level1 = a16.user_group_level1_key) 
join ldb.dh_user_group_classification_hierarchy_level2 a125 
on (a16.user_group_level2_key = a125.user_group_level2_key) 
union
select 'ldb.d_calendar_fiscal_year a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_greg_fiscal a19 
on (a11.opened_on_key = a19.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a110 
on (a19.fiscal_calendar_key = a110.row_key) 
join ldb.d_calendar_fiscal_year a128 
on (a110.year_start_date_key = a128.row_key) 

)a
)b