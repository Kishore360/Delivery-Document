select  		'f_change_request' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
union
select  		'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_internal_organization_department            a12
on   		    (a11.requested_by_department_key = a12.row_key)
union

select  		'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_internal_contact            a13
on   		    (a11.opened_by_key = a13.row_key)
union

select  		'd_change_request' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_change_request            a14
on   		    (a11.change_request_key = a14.row_key)
union

select  		'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_calendar_date            a15
on   		    (a11.opened_on_key = a15.row_key)
union

select  		'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_internal_contact            a16
on   		    (a11.assigned_to_key = a16.row_key)
union

select  		'd_internal_organization_group' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_internal_organization_group            a17
on   		    (a11.assignment_group_key = a17.row_key)
union

select  		'd_internal_contact_business_analyst_c' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_internal_contact_business_analyst_c            a18
on   		    (a11.business_analyst_c_key = a18.row_key)
union

select  		'd_calendar_date_cab' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_calendar_date_cab            a19
on   		    (a11.cab_on_key = a19.row_key)
union

select  		'd_change_request_category' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_change_request_category            a110
on   		    (a11.category_src_key = a110.row_key)
union

select  		'd_internal_contact_change_implementer_c' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_internal_contact_change_implementer_c            a111
on   		    (a11.change_implementer_c_key = a111.row_key)
union

select  		'd_change_request_reason' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_change_request_reason            a112
on   		    (a11.reason_src_key = a112.row_key)
union

select  		'd_change_request_state' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_change_request_state            a113
on   		    (a11.state_src_key = a113.row_key)
union

select  		'd_change_request_review_status' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_change_request_review_status            a114
on   		    (a11.review_status_src_key = a114.row_key)
union

select  		'd_change_request_risk' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_change_request_risk            a115
on   		    (a11.risk_src_key = a115.row_key)
union

select  		'd_change_request_scope' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_change_request_scope            a116
on   		    (a11.scope_src_key = a116.row_key)
union

select  		'd_standard_change_template_c' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_standard_change_template_c            a117
on   		    (a11.change_template_c_key = a117.row_key)
union

select  		'd_change_request_type' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_change_request_type            a118
on   		    (a11.type_src_key = a118.row_key)
union

select  		'd_change_request_complexity_c' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_change_request_complexity_c            a119
on   		    (a11.complexity_c_key = a119.row_key)
union

select  		'd_configuration_item' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_configuration_item            a120
on   		    (a11.configuration_item_key = a120.row_key)
union

select  		'd_domain' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_domain            a121
on   		    (a11.domain_key = a121.row_key)
union

select  		'd_internal_contact_mdm' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_internal_contact            a13
on   		    (a11.opened_by_key = a13.row_key)
left outer join ldb.d_internal_contact_mdm            a122
on   		    (a13.row_current_key = a122.row_current_key)
union

select  		'd_incident' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_incident            a123
on   		    (a11.critical_incident_c_key = a123.row_key)
union

select  		'd_project' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_project            a124
on   		    (a11.project_c_key = a124.row_key)
union

select  		'd_change_request_scope_of_impact_c' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_change_request_scope_of_impact_c            a125
on   		    (a11.scope_of_impact_c_key = a125.row_key)
union

select  		'd_task_impact' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_task_impact            a126
on   		    (a11.impact_src_key = a126.row_key)
union

select  		'd_location' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_location            a127
on   		    (a11.location_key = a127.row_key)
union

select  		'd_task_priority' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_task_priority            a128
on   		    (a11.priority_src_key = a128.row_key)
union

select  		'd_task_contacttype' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_task_contacttype            a129
on   		    (a11.reported_type_src_key = a129.row_key)
union

select  		'd_task_urgency' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_task_urgency            a130
on   		    (a11.urgency_src_key = a130.row_key)
union

select  		'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_calendar_date            a15
on   		    (a11.opened_on_key = a15.row_key)
left outer join ldb.d_calendar_month            a131
on   		    (a15.month_start_date_key = a131.row_key)
union

select  		'd_calendar_quarter' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_calendar_date            a15
on   		    (a11.opened_on_key = a15.row_key)
left outer join ldb.d_calendar_quarter            a132
on   		    (a15.quarter_start_date_key = a132.row_key)
union

select  		'd_calendar_year' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_change_request a11 
left outer join ldb.d_calendar_date            a15
on   		    (a11.opened_on_key = a15.row_key)
left outer join ldb.d_calendar_year            a133
on   		    (a15.year_start_date_key = a133.row_key)