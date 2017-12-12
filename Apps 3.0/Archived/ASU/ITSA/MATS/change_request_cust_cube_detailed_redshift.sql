select 'f_change_request' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
union
select  'd_lov' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  asu_mdwdb.d_lov   b
on  (a.approval_state_src_key = b.row_key)
UNION
select  'd_internal_contact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  asu_mdwdb.d_internal_contact  b
on  (a.change_requester_c_key = b.row_key)
UNION 
select  'd_lov1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  asu_mdwdb.d_lov   b
on  (a.closed_status_src_c_key = b.row_key)
UNION 
select  'd_request_item' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  asu_mdwdb.d_request_item   b
on  (a.change_document_c_key = b.row_key)
UNION 
select 'ldb.dh_user_group_level1 a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level1 a124 
on (a14.lev_1_key = a124.row_key) 
UNION 
select  'd_location' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  ldb.d_location   b
on  (a.location_key = b.row_key)
UNION 
select  'ldb.d_internal_organization_group' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  ldb.d_internal_organization_group  b
on  (a.assignment_group_key = b.row_key)
UNION 
select  'd_internal_organization_department' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join ldb.d_internal_organization_department  b
on  (a.requested_by_department_key = b.row_key)
UNION 
select  'd_internal_contact_requester_c' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join ldb.d_internal_contact_requester_c  b
on  (a.requested_by_key = b.row_key)
UNION
select 'ldb.d_internal_contact_mdm a119' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a14 on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a119 on (a14.row_current_key = a119.row_current_key) 
UNION
select  'd_internal_contact_assigned_to' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join ldb.d_internal_contact_assigned_to b on  (a.assigned_to_key = b.row_key)
UNION 
select  'd_domain' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join ldb.d_domain b on  (a.domain_key = b.row_key)
UNION 
select 'd_internal_contact' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a14 on (a11.opened_by_key = a14.row_key) 
UNION 
select 'd_configuration_item' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a14 on (a11.configuration_item_key = a14.row_key) 
UNION 
select 'd_change_request_urgency' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a14 on (a11.urgency_src_key = a14.row_key)
UNION 
select 'd_change_request_type' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a14 on (a11.change_request_key = a14.row_key)
UNION 
select 'd_change_request_state' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a14 on (a11.state_src_key = a14.row_key)
UNION 
select 'd_change_request_scope' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a14 on (a11.scope_src_key = a14.row_key)
UNION 
select 'd_change_request_risk' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a14 on (a11.risk_src_key = a14.row_key)
UNION 
select 'd_change_request_review_status' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_review_status a14 on (a11.review_status_src_key = a14.row_key)
UNION 
select 'd_change_request_reported_type' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a14 on (a11.reported_type_src_key = a14.row_key)
UNION 
select 'd_change_request_reason' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reason a14 on (a11.reason_src_key = a14.row_key)
UNION 
select 'd_change_request_impact' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_impact  a14 on (a11.impact_src_key = a14.row_key)
UNION 
select 'd_change_request_priority' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority  a14 on (a11.priority_src_key  = a14.row_key)
UNION 
select 'd_change_request_approval' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_approval  a14 on (a11.approval_state_src_key  = a14.row_key)
UNION 
select 'd_change_request_approval_c' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_approval_c  a14 on (a11.approval_state_src_key = a14.row_key)
UNION 
select 'd_change_request_approval_c' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_approval_c  a14 on (a11.approval_state_src_key = a14.row_key)
UNION 
select 'd_change_request_category' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category  a14 on (a11.category_src_key = a14.row_key)
UNION 
select 'd_change_request_closed_status_c' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_closed_status_c  a14 on (a11.closed_status_src_c_key = a14.row_key)
UNION 
select 'd_change_request' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a14 on (a11.parent_change_request_key = a14.row_key)
UNION 
select 'd_business_service' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a14 on (a11.business_service_key = a14.row_key)




   






