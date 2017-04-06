select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
union
select 'ldb.d_business_service a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_business_service a12 
on (a11.business_service_key = a12.row_key)
union
select 'ldb.d_business_service_criticality a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_business_service a12 
on (a11.business_service_key = a12.row_key)
join ldb.d_business_service_criticality a13
on (a12.criticality_key = a13.row_key)
union
select 'ldb.d_business_service_used_for a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_business_service a12 
on (a11.business_service_key = a12.row_key)
join ldb.d_business_service_used_for a13
on (a12.used_for_src_key = a13.row_key)
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key)
union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_quarter a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_quarter a13
on (a12.quarter_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_week a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_week a13
on (a12.week_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_year a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_year a13
on (a12.year_start_date_key = a13.row_key)
union
select 'ldb.d_change_request a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key)
union
select 'ldb.d_change_request_approval a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_approval a12 
on (a11.approval_state_src_key = a12.row_key)
union
select 'ldb.d_change_request_category a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_category a12 
on (a11.category_src_key = a12.row_key)
union
select 'ldb.d_change_request_impact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_impact a12 
on (a11.impact_src_key = a12.row_key)
union
select 'ldb.d_change_request_priority a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_priority a12 
on (a11.priority_src_key = a12.row_key)
union
select 'ldb.d_change_request_reason a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_reason a12 
on (a11.reason_src_key = a12.row_key)
union
select 'ldb.d_change_request_reported_type a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_reported_type a12 
on (a11.reported_type_src_key = a12.row_key)
union
select 'ldb.d_change_request_reported_type a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_review_status a12 
on (a11.review_status_src_key = a12.row_key)
union
select 'ldb.d_change_request_risk a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_risk a12 
on (a11.risk_src_key = a12.row_key)
union
select 'ldb.d_change_request_scope a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_scope a12 
on (a11.scope_src_key = a12.row_key)
union
select 'ldb.d_change_request_state a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_state a12 
on (a11.state_src_key = a12.row_key)
union
select 'ldb.d_change_request_type a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_type a12 
on (a11.type_src_key = a12.row_key)
union
select 'ldb.d_change_request_urgency a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_urgency a12 
on (a11.urgency_src_key = a12.row_key)
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_domain a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_domain a12 
on (a11.domain_key = a12.row_key)
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key)
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key)
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact_assigned_to a12 
on (a11.assigned_to_key = a12.row_key)
union
select 'ldb.d_internal_contact_mdm a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm a13 
on (a12.row_current_key = a13.row_current_key)
union
select 'ldb.d_internal_organization_department a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_department a12 
on (a11.requested_by_department_key = a12.row_key)
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key)
union
select 'ldb.d_location a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_location a12 
on (a11.location_key = a12.row_key)