select'ldb.d_project' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_project a12 
on(a11.project_key=a12.row_key) 
union
select'ldb.d_calendar_date' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_calendar_date a13 
on(a11.planned_start_on_key=a13.row_key) 
union
select'ldb.d_project_parent_project' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11
join ldb.d_project a12 
on(a11.project_key=a12.row_key)  
join ldb.d_project_parent_project a14 
on(a12.parent_project_key=a14.row_key) 
union
select'ldb.d_project_top_project' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_project a12 
on(a11.project_key=a12.row_key) 
join ldb.d_project_top_project a15 
on(a12.top_project_key=a15.row_key) 
union
select'ldb.d_portfolio' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11
join ldb.d_project a12 
on(a11.project_key=a12.row_key) 
join ldb.d_project_top_project a15 
on(a12.top_project_key=a15.row_key) 
join ldb.d_portfolio a16 
on(a15.portfolio_key=a16.row_key) 
union
select'ldb.d_lov_project_state_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11
join ldb.d_project a12 
on(a11.project_key=a12.row_key) 
join ldb.d_lov_project_state_view a17 
on(a12.project_state_src_key=a17.row_key) 
union
select'ldb.d_application' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_application a18 
on(a11.application_key=a18.row_key) 
union
select'ldb.d_business_service' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_business_service a19 
on(a11.business_service_key=a19.row_key) 
union
select'ldb.d_internal_organization_legalentity' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_internal_organization_legalentity a110 
on(a11.company_key=a110.row_key) 
union
select'ldb.d_configuration_item' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_configuration_item a111 
on(a11.configuration_item_key=a111.row_key) 
union
select'ldb.d_lov_project_cost_variance_bucket_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_lov_project_cost_variance_bucket_view a112 
on(a11.cost_variance_color_key=a112.row_key) 
union
select'ldb.d_domain' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_domain a113 
on(a11.domain_key=a113.row_key) 
union
select'ldb.d_lov_project_effort_variance_bucket_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_lov_project_effort_variance_bucket_view a114 
on(a11.effort_variance_color_key=a114.row_key) 
union
select'ldb.d_location' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_location a115 
on(a11.location_key=a115.row_key) 
union
select'ldb.d_internal_contact_project_manager' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_internal_contact_project_manager a116 
on(a11.project_manager_key=a116.row_key) 
union
select'ldb.d_lov_project_risk_bucket_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_lov_project_risk_bucket_view a117 
on(a11.project_risk_color_key=a117.row_key) 
union
select'ldb.d_lov_project_schedule_variance_bucket_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_lov_project_schedule_variance_bucket_view a118 
on(a11.schedule_variance_color_key=a118.row_key) 
union
select'ldb.d_lov_project_approval_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11
join ldb.d_project a12 
on(a11.project_key=a12.row_key) 
join ldb.d_lov_project_approval_view a119 
on(a12.project_approval_src_key=a119.row_key) 
union
select'ldb.d_lov_project_contact_type_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11
join ldb.d_project a12 
on(a11.project_key=a12.row_key) 
join ldb.d_lov_project_contact_type_view a120 
on(a12.project_contact_type_src_key=a120.row_key) 
union
select'ldb.d_lov_project_escalation_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_project a12 
on(a11.project_key=a12.row_key)
join ldb.d_lov_project_escalation_view a121 
on(a12.project_escalation_src_key=a121.row_key) 
union
select'ldb.d_lov_project_impact_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_project a12 
on(a11.project_key=a12.row_key)
join ldb.d_lov_project_impact_view a122 
on(a12.project_impact_src_key=a122.row_key) 
union
select'ldb.d_lov_project_phase_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_project a12 
on(a11.project_key=a12.row_key)
join ldb.d_lov_project_phase_view a123 
on(a12.project_phase_src_key=a123.row_key) 
union
select'ldb.d_lov_project_phase_type_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_project a12 
on(a11.project_key=a12.row_key)
join ldb.d_lov_project_phase_type_view a124 
on(a12.project_phase_type_src_key=a124.row_key) 
union
select'ldb.d_lov_project_priority_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_project a12 
on(a11.project_key=a12.row_key)
join ldb.d_lov_project_priority_view a125 
on(a12.project_priority_src_key=a125.row_key) 
union
select'ldb.d_lov_project_risk_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11
join ldb.d_project a12 
on(a11.project_key=a12.row_key) 
join ldb.d_lov_project_risk_view a126 
on(a12.project_risk_src_key=a126.row_key) 
union
select'ldb.d_lov_project_urgency_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11
join ldb.d_project a12 
on(a11.project_key=a12.row_key) 
join ldb.d_lov_project_urgency_view a127 
on(a12.project_urgency_src_key=a127.row_key) 
union
select'ldb.d_lov_portfolio_category_view' as Table_Name,count(1)Row_Count 
from ldb.f_project_task_current_year a11 
join ldb.d_project a12 
on(a11.project_key=a12.row_key) 
join ldb.d_project_top_project a15 
on(a12.top_project_key=a15.row_key) 
join ldb.d_portfolio a16 
on(a15.portfolio_key=a16.row_key)
join ldb.d_lov_portfolio_category_view a128 
on(a16.portfolio_category_src_key=a128.row_key);
