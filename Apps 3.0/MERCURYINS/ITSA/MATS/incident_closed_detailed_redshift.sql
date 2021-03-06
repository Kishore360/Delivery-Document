select 'ldb.f_incident_closed	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
union
select 'ldb.d_calendar_date	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_calendar_date	a12 
on (a11.closed_on_key = a12.row_key) 
union
select 'ldb.d_customer	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_customer	a13 
on (a11.customer_key = a13.row_key) 
union
select 'ldb.d_calendar_time	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_calendar_time	a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_business_service	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_business_service	a15 
on (a11.business_service_key = a15.row_key) 
union
select 'ldb.d_incident	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_incident	a16 
on (a11.incident_key = a16.row_key) 
union
select 'ldb.d_configuration_item	a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_configuration_item	a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_internal_contact_opened_by	a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_internal_contact_opened_by	a18 
on (a11.opened_by_key = a18.row_key) 
union
select 'ldb.d_problem	a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_problem	a19 
on (a11.problem_key = a19.row_key) 
union
select 'ldb.d_internal_contact_assigned_to	a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_internal_contact_assigned_to	a110 
on (a11.assigned_to_key = a110.row_key) 
union
select 'ldb.d_internal_organization_group	a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_internal_organization_group	a111 
on (a11.assignment_group_key = a111.row_key) 
union
select 'ldb.d_incident_call_back_for_ticket	a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_incident_call_back_for_ticket	a112 
on (a11.call_back_for_ticket_c_key = a112.row_key) 
union
select 'ldb.d_internal_contact_caller_c	a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_internal_contact_caller_c	a113 
on (a11.caller_c_key = a113.row_key) 
union
select 'ldb.d_change_request_caused_by	a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_change_request_caused_by	a114 
on (a11.caused_by_change_key = a114.row_key) 
union
select 'ldb.d_change_request	a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_change_request	a115 
on (a11.change_request_key = a115.row_key) 
union
select 'ldb.d_internal_contact_closed_by	a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_internal_contact_closed_by	a116 
on (a11.closed_by_key = a116.row_key) 
union
select 'ldb.d_internal_organization_legalentity	a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_internal_organization_legalentity	a117 
on (a11.company_key = a117.row_key) 
union
select 'ldb.d_customer_mdm	a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_customer	a13 
on (a11.customer_key = a13.row_key) 
join	ldb.d_customer_mdm	a118 
on (a13.row_current_key = a118.row_current_key) 
union
select 'ldb.d_internal_organization_department	a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_internal_organization_department	a119 
on (a11.opened_by_department_key = a119.row_key) 
union
select 'ldb.d_domain	a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_domain	a120 
on (a11.domain_key = a120.row_key) 
union
select 'ldb.d_calendar_time_hour	a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_calendar_time	a14 
on (a11.opened_time_key = a14.row_key) 
join	ldb.d_calendar_time_hour	a121 
on (a14.hour_24_format_num = a121.hour_24_format_num) 
union
select 'ldb.d_line_of_business_c	a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_line_of_business_c	a122 
on (a11.line_of_business_src_c_key = a122.row_key) 
union
select 'ldb.d_internal_contact	a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_internal_contact	a123 
on (a11.last_resolved_by_key = a123.row_key) 
union
select 'ldb.d_lov_escalation_view_c	a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_lov_escalation_view_c	a124 
on (a11.escalation_c_key = a124.row_key) 
union
select 'ldb.o_data_freshness	a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.o_data_freshness	a125 
on (a11.source_id = a125.source_id) 
union
select 'ldb.d_task_impact	a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_task_impact	a126 
on (a11.impact_src_key = a126.row_key) 
union
select 'ldb.d_location	a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_location	a127 
on (a11.location_key = a127.row_key) 
union
select 'ldb.d_task_priority	a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_task_priority	a128 
on (a11.priority_src_key = a128.row_key) 
union
select 'ldb.d_task_contacttype	a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_task_contacttype	a129 
on (a11.reported_type_src_key = a129.row_key) 
union
select 'ldb.d_task_urgency	a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_task_urgency	a130 
on (a11.urgency_src_key = a130.row_key) 
union
select 'ldb.d_business_service_criticality	a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_business_service	a15 
on (a11.business_service_key = a15.row_key) 
join	ldb.d_business_service_criticality	a131 
on (a15.criticality_key = a131.row_key) 
union
select 'ldb.d_incident_category	a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_incident	a16 
on (a11.incident_key = a16.row_key) 
join	ldb.d_incident_category	a132 
on (a16.category_src_key = a132.row_key) 
union
select 'ldb.d_incident_close_code	a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_incident	a16 
on (a11.incident_key = a16.row_key) 
join	ldb.d_incident_close_code	a133 
on (a16.close_code_src_key = a133.row_key) 
union
select 'ldb.d_incident_severity	a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_incident	a16 
on (a11.incident_key = a16.row_key) 
join	ldb.d_incident_severity	a134 
on (a16.severity_src_key = a134.row_key) 
union
select 'ldb.d_incident_state	a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_incident	a16 
on (a11.incident_key = a16.row_key) 
join	ldb.d_incident_state	a135 
on (a16.state_src_key = a135.row_key) 
union
select 'ldb.d_incident_subcategory	a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_incident	a16 
on (a11.incident_key = a16.row_key) 
join	ldb.d_incident_subcategory	a136 
on (a16.sub_category_src_key = a136.row_key) 
union
select 'ldb.d_internal_contact_manager_c	a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_internal_contact_opened_by	a18 
on (a11.opened_by_key = a18.row_key) 
join	ldb.d_internal_contact_manager_c	a137 
on (a18.manager_c_key = a137.row_key) 
union
select 'ldb.d_calendar_month	a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed	a11 
join	ldb.d_calendar_date	a12 
on (a11.closed_on_key = a12.row_key) 
join	ldb.d_calendar_month	a138 
on (a12.month_start_date_key = a138.row_key) 