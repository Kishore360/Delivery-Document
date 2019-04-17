select  'ldb.f_incident' as tablename,  case when a.cnt = 0 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.f_incident where row_key in (0,-1))a 
Union
select  'ldb.f_incident_closed' as tablename,  case when a.cnt = 0 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.f_incident_closed where row_key in (0,-1))a 
Union
select  'ldb.f_incident_resolved' as tablename,  case when a.cnt = 0 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.f_incident_resolved where row_key in (0,-1))a 
Union
select  'ldb.d_configuration_item' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_configuration_item where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact_assigned_to' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact_assigned_to where row_key in (0,-1))a 
Union
select  'ldb.d_internal_organization_group' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_organization_group where row_key in (0,-1))a 
Union
select  'ldb.d_business_service' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_business_service where row_key in (0,-1))a 
Union
select  'ldb.d_incident' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_incident where row_key in (0,-1))a 
Union
select  'ldb.d_change_request_caused_by' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_change_request_caused_by where row_key in (0,-1))a 
Union
select  'ldb.d_change_request' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_change_request where row_key in (0,-1))a 
Union
select  'ldb.d_customer' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_customer where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact_opened_by_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact_opened_by_c where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact_caller_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact_caller_c where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact_employee_type_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact_employee_type_c where row_key in (0,-1))a 
Union
select  'ldb.d_internal_organization_group_parent_internal_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_organization_group_parent_internal_c where row_key in (0,-1))a 
Union
select  'ldb.d_employee_duration_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_employee_duration_c where row_key in (0,-1))a 
Union
select  'ldb.d_internal_organization_legalentity' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_organization_legalentity where row_key in (0,-1))a 
Union
select  'ldb.d_duration_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_duration_c where row_key in (0,-1))a 
Union
select  'ldb.d_incident_agebucket' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_incident_agebucket where row_key in (0,-1))a 
Union
select  'ldb.d_category_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_category_c where row_key in (0,-1))a 
Union
select  'ldb.d_incident_contacttype' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_incident_contacttype where row_key in (0,-1))a 
Union
select  'ldb.d_incident_impact' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_incident_impact where row_key in (0,-1))a 
Union
select  'ldb.d_incident_urgency' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_incident_urgency where row_key in (0,-1))a 
Union
select  'ldb.d_lov_incident_method_of_contact_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_lov_incident_method_of_contact_c where row_key in (0,-1))a 
Union
select  'ldb.d_flag_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_flag_c where row_key in (0,-1))a 
Union
select  'ldb.d_lov_incident_service_type_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_lov_incident_service_type_c where row_key in (0,-1))a 
Union
select  'ldb.d_lov_incident_resolver_department_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_lov_incident_resolver_department_c where row_key in (0,-1))a 
Union
select  'ldb.d_location' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_location where row_key in (0,-1))a 
Union
select  'ldb.d_lov_incident_type_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_lov_incident_type_c where row_key in (0,-1))a 
Union
select  'ldb.d_lov_incident_who_is_affected_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_lov_incident_who_is_affected_c where row_key in (0,-1))a 
Union
select  'ldb.d_lov_configuration_item_application_tier_src_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_lov_configuration_item_application_tier_src_c where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact_assigned_to_mdm_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact_assigned_to_mdm_c where row_key in (0,-1))a 
Union
select  'ldb.d_lov_sys_user_group_portfolio_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_lov_sys_user_group_portfolio_c where row_key in (0,-1))a 
Union
select  'ldb.d_business_service_criticality' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_business_service_criticality where row_key in (0,-1))a 
Union
select  'ldb.d_business_service_used_for' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_business_service_used_for where row_key in (0,-1))a 
Union
select  'ldb.d_customer_mdm' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_customer_mdm where row_key in (0,-1))a 
Union
select  'ldb.d_internal_organization_department' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_organization_department where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact_mdm' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact_mdm where row_key in (0,-1))a 
Union
select  'ldb.d_incident_close_code' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_incident_close_code where row_key in (0,-1))a 
Union
select  'ldb.d_lov_sc_req_item_employee_type_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_lov_sc_req_item_employee_type_c where row_key in (0,-1))a 
Union
select  'ldb.d_incident_priority' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_incident_priority where row_key in (0,-1))a 
Union
select  'ldb.d_task_sla_resolution_flag' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_task_sla_resolution_flag where row_key in (0,-1))a 
Union
select  'ldb.d_task_sla_response_flag' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_task_sla_response_flag where row_key in (0,-1))a 
Union
select  'ldb.d_incident_severity' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_incident_severity where row_key in (0,-1))a 
Union
select  'ldb.d_incident_state' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_incident_state where row_key in (0,-1))a 
Union
select  'ldb.d_incident_subcategory' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_incident_subcategory where row_key in (0,-1))a 
Union
select  'ldb.d_internal_organization_group_parent_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_organization_group_parent_c where row_key in (0,-1))a 

