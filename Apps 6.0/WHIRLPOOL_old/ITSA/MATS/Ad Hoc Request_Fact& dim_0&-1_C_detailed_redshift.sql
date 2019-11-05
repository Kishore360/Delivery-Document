select  'ldb.f_ad_hoc_request_c' as tablename,  case when a.cnt = 0 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.f_ad_hoc_request_c where row_key in (0,-1))a 
Union
select  'ldb.f_ad_hoc_request_closed_c' as tablename,  case when a.cnt = 0 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.f_ad_hoc_request_closed_c where row_key in (0,-1))a 
Union
select  'ldb.f_ad_hoc_request_resolved_c' as tablename,  case when a.cnt = 0 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.f_ad_hoc_request_resolved_c where row_key in (0,-1))a 
Union
select  'ldb.d_ad_hoc_request_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_ad_hoc_request_c where row_key in (0,-1))a 
Union
select  'ldb.d_ci_autofill_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_ci_autofill_c where row_key in (0,-1))a 
Union
select  'ldb.d_configuration_item' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_configuration_item where row_key in (0,-1))a 
Union
select  'ldb.d_internal_organization_group' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_organization_group where row_key in (0,-1))a 
Union
select  'ldb.d_ad_hoc_request_agebucket_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_ad_hoc_request_agebucket_c where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact_assigned_to' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact_assigned_to where row_key in (0,-1))a 
Union
select  'ldb.d_business_service' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_business_service where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact_caller' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact_caller where row_key in (0,-1))a 
Union
select  'ldb.d_change_request' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_change_request where row_key in (0,-1))a 
Union
select  'ldb.d_cost_center' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_cost_center where row_key in (0,-1))a 
Union
select  'ldb.d_adhoc_requested_for_location_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_adhoc_requested_for_location_c where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact_opened_by_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact_opened_by_c where row_key in (0,-1))a 
Union
select  'ldb.d_region_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_region_c where row_key in (0,-1))a 
Union
select  'ldb.d_ad_hoc_request_on_hold_type_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_ad_hoc_request_on_hold_type_c where row_key in (0,-1))a 
Union
select  'ldb.d_service_business_service_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_service_business_service_c where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact_requested_for' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact_requested_for where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact_resolved_by_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact_resolved_by_c where row_key in (0,-1))a 
Union
select  'ldb.d_ad_hoc_request_priority_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_ad_hoc_request_priority_c where row_key in (0,-1))a 
Union
select  'ldb.d_ad_hoc_request_reported_type_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_ad_hoc_request_reported_type_c where row_key in (0,-1))a 
Union
select  'ldb.d_ad_hoc_request_state_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_ad_hoc_request_state_c where row_key in (0,-1))a 
Union
select  'ldb.d_internal_organization_support_group_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_organization_support_group_c where row_key in (0,-1))a 
Union
select  'ldb.d_internal_organization_vendor_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_organization_vendor_c where row_key in (0,-1))a 
Union
select  'ldb.d_internal_contact_queue_manager_c' as tablename,  case when a.cnt = 2 then 'SUCCESS' else 'FAILURE'end as Result
from (
select count(row_key) as cnt  from ldb.d_internal_contact_queue_manager_c where row_key in (0,-1))a 