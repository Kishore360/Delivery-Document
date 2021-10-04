select 'ldb.f_macm_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_macm_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_macm_c a14 
on (a11.macm_c_key = a14.row_key) 
union
select 'ldb.d_macm_c_state a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_macm_c a14 
on (a11.macm_c_key = a14.row_key) 
join ldb.d_macm_c_state a15 
on (a14.state_src_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_internal_contact_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a19 
on (a12.row_current_key = a19.row_current_key) 
union
select 'ldb.d_incident a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
union
select 'ldb.d_internal_contact_macm_authorizor_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact_macm_authorizor_c a111 
on (a11.authorizor_key = a111.row_key) 
union
select 'ldb.d_internal_contact_macm_business_approver_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact_macm_business_approver_c a112 
on (a11.business_approver_key = a112.row_key) 
union
select 'ldb.d_internal_contact_macm_business_tester_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact_macm_business_tester_c a113 
on (a11.business_tester_key = a113.row_key) 
union
select 'ldb.d_internal_contact_macm_deploy_approver_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact_macm_deploy_approver_c a114 
on (a11.deploy_approver_key = a114.row_key) 
union
select 'ldb.d_internal_contact_macm_deployer_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact_macm_deployer_c a115 
on (a11.deployer_key = a115.row_key) 
union
select 'ldb.d_internal_contact_macm_developer_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact_macm_developer_c a116 
on (a11.developer_key = a116.row_key) 
union
select 'ldb.d_internal_contact_macm_is_approver_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact_macm_is_approver_c a117 
on (a11.is_approver_key = a117.row_key) 
union
select 'ldb.d_internal_contact_macm_is_tester_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact_macm_is_tester_c a118 
on (a11.is_tester_key = a118.row_key) 
union
select 'ldb.d_internal_contact_macm_requester_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact_macm_requester_c a119 
on (a11.requester_key = a119.row_key) 
union
select 'ldb.d_problem a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_problem a120 
on (a11.problem_key = a120.row_key) 
union
select 'ldb.d_request_item a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_request_item a121 
on (a11.request_item_key = a121.row_key) 
union
select 'ldb.d_internal_contact_macm_reviewer_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_internal_contact_macm_reviewer_c a122 
on (a11.macm_reviewer_c_key = a122.row_key) 
union
select 'ldb.d_calendar_month a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_month a123 
on (a13.month_start_date_key = a123.row_key) 
union
select 'ldb.d_calendar_week a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_week a124 
on (a13.week_start_date_key = a124.row_key) 
union
select 'ldb.d_macm_c_change_reason a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_macm_c a14 
on (a11.macm_c_key = a14.row_key) 
join ldb.d_macm_c_change_reason a125 
on (a14.change_reason_src_key = a125.row_key) 
union
select 'ldb.d_macm_c_component a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_macm_c a14 
on (a11.macm_c_key = a14.row_key) 
join ldb.d_macm_c_component a126 
on (a14.component_src_key = a126.row_key) 
union
select 'ldb.d_macm_c_cross_application_impact a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_macm_c a14 
on (a11.macm_c_key = a14.row_key) 
join ldb.d_macm_c_cross_application_impact a127 
on (a14.cross_application_impact_src_key = a127.row_key) 
union
select 'ldb.d_macm_c_priority a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_macm_c a14 
on (a11.macm_c_key = a14.row_key) 
join ldb.d_macm_c_priority a128 
on (a14.priority_src_key = a128.row_key) 
union
select 'ldb.d_calendar_quarter a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_quarter a129 
on (a13.quarter_start_date_key = a129.row_key) 
union
select 'ldb.d_calendar_year a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_macm_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_year a130 
on (a13.year_start_date_key = a130.row_key) 