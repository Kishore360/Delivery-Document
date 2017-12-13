select 'ldb.f_n_project_task_weekly a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
union
select 'ldb.d_project a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
union
select 'ldb.d_project_parent_project a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_project_parent_project a13 
on (a12.parent_project_key = a13.row_key) 
union
select 'ldb.d_project_top_project a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_project_top_project a14 
on (a12.top_project_key = a14.row_key) 
union
select 'ldb.d_portfolio a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) join ldb.d_project_top_project a14 
on (a12.top_project_key = a14.row_key) 
join ldb.d_portfolio a15 
on (a14.portfolio_key = a15.row_key) 
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_business_service a16 
on (a11.business_service_key = a16.row_key) 
union
select 'ldb.d_calendar_week a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_calendar_week a17 
on (a11.n_key = a17.row_key) 
union
select 'ldb.d_internal_organization_legalentity a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_internal_organization_legalentity a18 
on (a11.company_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_lov_project_cost_variance_bucket_view a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_lov_project_cost_variance_bucket_view a110 
on (a11.cost_variance_color_key = a110.row_key) 
union
select 'ldb.d_domain a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_domain a111 
on (a11.domain_key = a111.row_key) 
union
select 'ldb.d_lov_project_effort_variance_bucket_view a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_lov_project_effort_variance_bucket_view a112 
on (a11.effort_variance_color_key = a112.row_key) 

union
select 'ldb.d_internal_contact_project_manager a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_internal_contact_project_manager a114 
on (a11.project_manager_key = a114.row_key) 
union
select 'ldb.d_lov_project_risk_bucket_view a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_lov_project_risk_bucket_view a115 
on (a11.project_risk_color_key = a115.row_key) 
union
select 'ldb.d_lov_project_schedule_variance_bucket_view a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_lov_project_schedule_variance_bucket_view a116 
on (a11.schedule_variance_color_key = a116.row_key) 
union
select 'ldb.d_lov_project_state_view a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_state_view a117 
on (a12.project_state_src_key = a117.row_key) 
union
select 'ldb.d_location a1221 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_location a1221 
on (a11.location_key = a1221.row_key)
union
select 'ldb.d_lov_project_priority_view a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_priority_view a118 
on (a12.project_priority_src_key = a118.row_key) 
union
select 'ldb.d_lov_project_risk_view a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_risk_view a119 
on (a12.project_risk_src_key = a119.row_key) 
union
select 'ldb.d_lov_portfolio_category_view a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_project_task_weekly a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) join ldb.d_project_top_project a14 
on (a12.top_project_key = a14.row_key) join ldb.d_portfolio a15 
on (a14.portfolio_key = a15.row_key) 
join ldb.d_lov_portfolio_category_view a120 
on (a15.portfolio_category_src_key = a120.row_key)