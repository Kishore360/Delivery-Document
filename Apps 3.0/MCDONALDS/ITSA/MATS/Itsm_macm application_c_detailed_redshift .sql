SELECT 'ldb.f_macm_c' AS Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_macm_c a11
UNION 
select 'ldb.d_macm_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11 
join  ldb.d_macm_c a12 on (a11.macm_c_key=a12.row_key)
UNION 
select 'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11 
join  ldb.d_configuration_item a12 on (a11.configuration_item_key=a12.row_key)
UNION 
select 'ldb.d_macm_c_cross_application_impact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11 
join  ldb.d_macm_c a12 on (a11.macm_c_key=a12.row_key)
join  ldb.d_macm_c_cross_application_impact a13 on (a12.cross_application_impact_src_key=a13.row_key)
UNION 
select 'ldb.d_macm_c_component' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11 
join  ldb.d_macm_c a12 on (a11.macm_c_key=a12.row_key)
join  ldb.d_macm_c_component a13 on (a12.component_src_key=a13.row_key)
UNION 
select 'ldb.d_macm_c_change_reason' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11 
join  ldb.d_macm_c a12 on (a11.macm_c_key=a12.row_key)
join  ldb.d_macm_c_change_reason a13 on (a12.change_reason_src_key=a13.row_key)
UNION 
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11 
JOIN  ldb.d_calendar_date a12 on (a11.opened_on_key=a12.row_key)
join  ldb.d_calendar_month a13 on (a12.month_start_date_key=a13.row_key)
UNION 
select 'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11 
JOIN  ldb.d_calendar_date a12 on (a11.opened_on_key=a12.row_key)
UNION 
select 'ldb.d_macm_c_state' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11 
join  ldb.d_macm_c a12 on (a11.macm_c_key=a12.row_key)
JOIN  ldb.d_macm_c_state a13 on (a12.state_src_key=a13.row_key)
UNION 
select 'ldb.d_macm_c_priority' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11 
join  ldb.d_macm_c a12 on (a11.macm_c_key=a12.row_key)
JOIN  ldb.d_macm_c_priority a13 on (a12.priority_src_key=a13.row_key)
UNION 
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11 
JOIN  ldb.d_internal_contact a12 on (a11.opened_by_key=a12.row_key)
UNION 
select 'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11 
JOIN  ldb.d_internal_contact_assigned_to a12 on (a11.assigned_to_key=a12.row_key)
UNION 
select 'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11 
JOIN  ldb.d_problem a12 on (a11.problem_key=a12.row_key)
UNION 
select 'ldb.d_internal_contact_macm_requester_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11
JOIN ldb.d_internal_contact_macm_requester_c a12 on a11.requester_key=a12.row_key
UNION 
select 'ldb.d_internal_contact_macm_is_tester_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11
JOIN ldb.d_internal_contact_macm_is_tester_c a12 on a11.is_tester_key=a12.row_key
UNION 
select 'ldb.d_internal_contact_macm_is_approver_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11
JOIN ldb.d_internal_contact_macm_is_approver_c a12 on a11.is_approver_key=a12.row_key
UNION 
select 'ldb.d_internal_contact_macm_developer_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11
JOIN ldb.d_internal_contact_macm_developer_c a12 on a11.developer_key=a12.row_key
UNION 
select 'ldb.d_internal_contact_macm_deployer_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11
JOIN ldb.d_internal_contact_macm_deployer_c a12 on a11.deployer_key=a12.row_key
UNION
select 'ldb.d_internal_contact_macm_deploy_approver_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11
JOIN ldb.d_internal_contact_macm_deploy_approver_c a12 on a11.deploy_approver_key=a12.row_key
UNION
select 'ldb.d_internal_contact_macm_business_tester_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11
JOIN ldb.d_internal_contact_macm_business_tester_c a12 on a11.business_tester_key=a12.row_key
UNION
select 'ldb.d_internal_contact_macm_business_approver_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11
JOIN ldb.d_internal_contact_macm_business_approver_c a12 on a11.business_approver_key=a12.row_key
UNION 
select 'ldb.d_internal_contact_macm_authorizor_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11
JOIN ldb.d_internal_contact_macm_authorizor_c a12 on a11.authorizor_key=a12.row_key
UNION 
select 'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_macm_c a11
JOIN ldb.d_internal_organization_group a12 on a11.assignment_group_key=a12.row_key

