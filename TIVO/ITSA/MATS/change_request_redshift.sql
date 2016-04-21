select 'f_change_request' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11
union
select 'd_internal_organization_legalentity' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11
join        ldb.d_internal_organization_legalentity  a12
  on         (a11.company_key = a12.row_key)
union
select 'd_internal_contact' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11			  
join        ldb.d_internal_contact  a13
  on         (a11.opened_by_key = a13.row_key)
union
select 'd_calendar_date' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11						  
join        ldb.d_calendar_date      a14
  on         (a11.opened_on_key = a14.row_key)
union
select 'd_change_request' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11		
join        ldb.d_change_request  a15
  on         (a11.change_request_key = a15.row_key)
union
select 'd_internal_contact' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11					  
join        ldb.d_internal_contact  a16
  on         (a11.assigned_to_key = a16.row_key)
union
select 'd_internal_organization_group' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11					  
join        ldb.d_internal_organization_group         a17
  on         (a11.assignment_group_key = a17.row_key)
union
select 'd_lov_business_usage_change_request_c' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_lov_business_usage_change_request_c a18
  on         (a11.business_usage_src_c_key = a18.row_key)
union
select 'd_change_request_category' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_change_request_category             a19
  on         (a11.category_src_key = a19.row_key)
union
select 'd_change_request_reason' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_change_request_reason a110
  on         (a11.reason_src_key = a110.row_key)
union
select 'd_change_request_state' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_change_request_state     a111
  on         (a11.state_src_key = a111.row_key)
union
select 'd_change_request_review_status' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_change_request_review_status  a112
  on         (a11.review_status_src_key = a112.row_key)
union
select 'd_change_request_risk' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_change_request_risk        a113
  on         (a11.risk_src_key = a113.row_key)
union
select 'd_change_request_scope' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_change_request_scope   a114
  on         (a11.scope_src_key = a114.row_key)
union
select 'd_change_request_type' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_change_request_type      a115
  on         (a11.type_src_key = a115.row_key)
union
select 'd_lov_closure_code_change_request_c' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_lov_closure_code_change_request_c      a116
  on         (a11.closure_code_src_c_key = a116.row_key)
union
select 'd_configuration_item' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_configuration_item            a117
  on         (a11.configuration_item_key = a117.row_key)
union
select 'd_internal_organization_department' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_internal_organization_department            a118
  on         (a11.requested_by_department_key = a118.row_key)
union
select 'd_domain' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_domain    a119
  on         (a11.domain_key = a119.row_key)
union
select 'd_internal_contact_mdm' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_internal_contact  a13
  on         (a11.opened_by_key = a13.row_key)
 join        ldb.d_internal_contact_mdm    a120
  on         (a13.row_current_key = a120.row_current_key)
union
select 'd_task_impact' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_task_impact          a121
  on         (a11.impact_src_key = a121.row_key)
union
select 'd_location' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_location   a122
  on         (a11.location_key = a122.row_key)
union
select 'd_task_priority' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_task_priority         a123
  on         (a11.priority_src_key = a123.row_key)
union
select 'd_task_contacttype' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_task_contacttypea124
  on         (a11.reported_type_src_key = a124.row_key)
union
select 'd_task_urgency' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_task_urgency        a125
  on         (a11.urgency_src_key = a125.row_key)
union
select 'd_calendar_month' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_calendar_date      a14
  on         (a11.opened_on_key = a14.row_key)
join        ldb.d_calendar_month a126
  on         (a14.month_start_date_key = a126.row_key)
union
select 'd_calendar_week' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_calendar_date      a14
on         (a11.opened_on_key = a14.row_key)
join        ldb.d_calendar_week    a127
  on         (a14.week_start_date_key = a127.row_key)
union
select 'd_calendar_quarter' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_calendar_date      a14
  on         (a11.opened_on_key = a14.row_key)
join        ldb.d_calendar_quartera128
  on         (a14.quarter_start_date_key = a128.row_key)
union
select 'd_calendar_year' as Table_name, count(a11.row_key) Row_count
from      ldb.f_change_request  a11	
join        ldb.d_calendar_date      a14
on         (a11.opened_on_key = a14.row_key)
join        ldb.d_calendar_year      a129
on         (a14.year_start_date_key = a129.row_key)