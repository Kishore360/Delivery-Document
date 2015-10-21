SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_internal_contact            a12
on      (a11.opened_by_key = a12.row_key)
union

select  'd_location' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_location            a13
on      (a11.location_key = a13.row_key)
union

select  'd_change_request' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_change_request            a14
on      (a11.change_request_key = a14.row_key)
union

select  'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_calendar_date            a15
on      (a11.opened_on_key = a15.row_key)
union

select  'd_internal_contact_director_c' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_internal_contact_director_c            a16
on      (a11.assigned_director_c_key = a16.row_key)
union

select  'd_internal_contact_manager_c' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_internal_contact_manager_c            a17
on      (a11.assigned_manager_c_key = a17.row_key)
union

select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_internal_contact            a18
on      (a11.assigned_to_key = a18.row_key)
union

select  'd_internal_contact_vp_c' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_internal_contact_vp_c            a19
on      (a11.assigned_vp_c_key = a19.row_key)
union

select  'd_internal_organization_group' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_internal_organization_group            a110
on      (a11.assignment_group_key = a110.row_key)
union

select  'd_lov_automation_view_c' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_lov_automation_view_c            a111
on      (a11.automation_c_automatic_c_key = a111.row_key)
union

select  'd_lov_business_impact_view_c' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_lov_business_impact_view_c            a112
on      (a11.business_impact_c_key = a112.row_key)
union

select  'd_change_request_category' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_change_request_category            a113
on      (a11.category_src_key = a113.row_key)
union

select  'd_change_request_reason' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_change_request_reason            a114
on      (a11.reason_src_key = a114.row_key)
union

select  'd_change_request_state' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_change_request_state            a115
on      (a11.state_src_key = a115.row_key)
union

select  'd_change_request_review_status' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_change_request_review_status            a116
on      (a11.review_status_src_key = a116.row_key)
union

select  'd_change_request_risk' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_change_request_risk            a117
on      (a11.risk_src_key = a117.row_key)
union

select  'd_change_request_scope' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_change_request_scope            a118
on      (a11.scope_src_key = a118.row_key)
union

select  'd_change_request_type' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_change_request_type            a119
on      (a11.type_src_key = a119.row_key)
union

select  'd_lov_classification_view_c' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_lov_classification_view_c            a120
on      (a11.classification_c_key = a120.row_key)
union

select  'd_configuration_item' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_configuration_item            a121
on      (a11.configuration_item_key = a121.row_key)
union

select  'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_internal_organization_department            a122
on      (a11.requested_by_department_key = a122.row_key)
union

select  'd_lov_deployment_environment_view_c' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_lov_deployment_environment_view_c            a123
on      (a11.deployment_environment_c_key = a123.row_key)
union

select  'd_lov_size_view_c' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_lov_size_view_c            a124
on      (a11.size_c_key = a124.row_key)
union

select  'd_domain' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_domain            a125
on      (a11.domain_key = a125.row_key)
union

select  'd_internal_contact_mdm' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_internal_contact            a12
on      (a11.opened_by_key = a12.row_key)
join 	ldb.d_internal_contact_mdm            a126
on      (a12.row_current_key = a126.row_key)
union

select  'd_change_request_parent_change_c' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_change_request_parent_change_c            a127
on      (a11.parent_change_request_key = a127.row_key)
union

select  'd_task_priority' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_task_priority            a128
on      (a11.priority_src_key = a128.row_key)
union

select  'd_task_impact' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_task_impact            a129
on      (a11.impact_src_key = a129.row_key)
union

select  'd_task_contacttype' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_task_contacttype            a130
on      (a11.reported_type_src_key = a130.row_key)
union

select  'd_task_urgency' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_task_urgency            a131
on      (a11.urgency_src_key = a131.row_key)
union

select  'd_lov_work_characterization_view_c' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_lov_work_characterization_view_c            a132
on      (a11.work_characterization_c_key = a132.row_key)
union

select  'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_calendar_date            a15
on      (a11.opened_on_key = a15.row_key)
join 	ldb.d_calendar_month            a133
on      (a15.month_start_date_key = a133.row_key)
union

select  'd_calendar_quarter' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_calendar_date            a15
on      (a11.opened_on_key = a15.row_key) 
join 	ldb.d_calendar_quarter            a134
on      (a15.quarter_start_date_key = a134.row_key)
union

select  'd_calendar_year' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_change_request a11 
join 	ldb.d_calendar_date            a15
on      (a11.opened_on_key = a15.row_key)
join 	ldb.d_calendar_year            a135
on      (a15.year_start_date_key = a135.row_key)
)a)b