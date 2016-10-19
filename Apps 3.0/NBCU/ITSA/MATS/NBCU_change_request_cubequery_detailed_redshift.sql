
select 'f_change_request' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
union 
select 'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
 join  ldb.d_internal_contact  a12
on(a11.opened_by_key = a12.row_key)
union 
select 'd_business_service' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join  ldb.d_business_service a13
on(a11.business_service_key = a13.row_key)
union 
select 'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
 join  ldb.d_calendar_date a14
on(a11.opened_on_key = a14.row_key)
union 
select 'd_change_request' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join  ldb.d_change_request  a15
on(a11.change_request_key = a15.row_key)
union 
select 'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
 join  ldb.d_configuration_item a16
on(a11.configuration_item_key = a16.row_key)
union 
select 'd_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join  ldb.d_internal_contact_assigned_to a17
on(a11.assigned_to_key = a17.row_key)
union 
select 'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join  ldb.d_internal_organization_group a18
on(a11.assignment_group_key = a18.row_key)
union 
select 'd_change_request_category' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join  ldb.d_change_request_category a19
on(a11.category_src_key = a19.row_key)
union 
select 'd_change_request_impact' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join  ldb.d_change_request_impact a110
on(a11.impact_src_key = a110.row_key)
union 
select 'd_change_request_priority' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join  ldb.d_change_request_priority a111
on(a11.priority_src_key = a111.row_key)
union 
select 'd_change_request_reason' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join  ldb.d_change_request_reason a112
on(a11.reason_src_key = a112.row_key)
union 
select 'd_change_request_reported_type' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join  ldb.d_change_request_reported_type a113
on(a11.reported_type_src_key = a113.row_key)
union 
select 'd_change_request_state' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11  
  join  ldb.d_change_request_state  a114
on(a11.state_src_key = a114.row_key)
union 
select 'd_change_request_review_status' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join  ldb.d_change_request_review_status  a115
on(a11.review_status_src_key = a115.row_key)
union 
select 'd_change_request_risk' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join  ldb.d_change_request_risk  a116
on(a11.risk_src_key = a116.row_key)
union 
select 'd_change_request_scope' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
 join  ldb.d_change_request_scope a117
on(a11.scope_src_key = a117.row_key)
union 
select 'd_change_request_type' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
 join  ldb.d_change_request_type a118
on(a11.type_src_key = a118.row_key)
union 
select 'd_change_request_urgency' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
 join  ldb.d_change_request_urgency a119
on(a11.urgency_src_key = a119.row_key)
union 
select 'd_lov_change_request_completion_code_c' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join  ldb.d_lov_change_request_completion_code_c  a120
on(a11.completion_code_src_c_key = a120.row_key)
union 
select 'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
 join  ldb.d_internal_organization_department a121
on(a11.requested_by_department_key = a121.row_key)
union 
select 'd_domain' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join  ldb.d_domain a122
on(a11.domain_key = a122.row_key)
union 
select 'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11  
join  ldb.d_internal_contact  a12
on(a11.opened_by_key = a12.row_key)
  join  ldb.d_internal_contact_mdm a123
on(a12.row_current_key = a123.row_current_key)
union 
select 'd_lov_change_request_sub_category_c' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11  
  join  ldb.d_lov_change_request_sub_category_c a124
on(a11.sub_category_src_c_key = a124.row_key)
union 
select 'd_location' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
 join  ldb.d_location a125
on(a11.location_key = a125.row_key)
union 
select 'd_lov_change_request_urgency_category_c' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11  
  join  ldb.d_lov_change_request_urgency_category_c a126
on(a11.urgency_category_src_c_key = a126.row_key)
union 
select 'd_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join  ldb.d_business_service a13
on(a11.business_service_key = a13.row_key)
 join  ldb.d_business_service_criticality a127
on(a13.criticality_key = a127.row_key)
union 
select 'd_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11  
join  ldb.d_business_service a13
on(a11.business_service_key = a13.row_key)
  join  ldb.d_business_service_used_for  a128
on(a13.used_for_src_key = a128.row_key)
union 
select 'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
 join  ldb.d_calendar_date a14
on(a11.opened_on_key = a14.row_key)
join  ldb.d_calendar_month a129
on(a14.month_start_date_key = a129.row_key)
union 
select 'd_calendar_week' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
 join  ldb.d_calendar_date a14
on(a11.opened_on_key = a14.row_key)
 join  ldb.d_calendar_week a130
on(a14.week_start_date_key = a130.row_key)
union 
select 'd_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
 join  ldb.d_calendar_date a14
on(a11.opened_on_key = a14.row_key)
 join  ldb.d_calendar_quarter a131
on(a14.quarter_start_date_key = a131.row_key)
union 
select 'd_calendar_year' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_change_request a11  
 join  ldb.d_calendar_date a14
on(a11.opened_on_key = a14.row_key)
  join  ldb.d_calendar_year a132
on(a14.year_start_date_key = a132.row_key)



