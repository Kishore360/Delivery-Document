select'ldb.d_project' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_project a12
 on (a11.project_key=a12.row_key)
union
select'ldb.d_project_top_project' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_project a12
 on (a11.project_key=a12.row_key)
 join ldb.d_project_top_project a13
 on (a12.top_project_key=a13.row_key)
union
select'ldb.d_portfolio' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_project a12
 on (a11.project_key=a12.row_key)
 join ldb.d_project_top_project a13
 on (a12.top_project_key=a13.row_key)
 join ldb.d_portfolio a14
 on (a13.portfolio_key=a14.row_key)
union
select'ldb.d_business_service' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_business_service a15
 on (a11.business_service_key=a15.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_internal_organization_legalentity a16
 on (a11.company_key=a16.row_key)
union
select'ldb.d_configuration_item' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_configuration_item a17
 on (a11.configuration_item_key=a17.row_key)
union
select'ldb.d_lov_project_cost_variance_bucket_view' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_lov_project_cost_variance_bucket_view a18
 on (a11.cost_variance_color_key=a18.row_key)
union
select'ldb.d_domain' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_domain a19
 on (a11.domain_key=a19.row_key)
union
select'ldb.d_lov_project_effort_variance_bucket_view' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_lov_project_effort_variance_bucket_view a110
 on (a11.effort_variance_color_key=a110.row_key)
union
select'ldb.d_location' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_location a111
 on (a11.location_key=a111.row_key)
union
select'ldb.d_internal_contact_project_manager' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_internal_contact_project_manager a112
 on (a11.project_manager_key=a112.row_key)
union
select'ldb.d_lov_project_risk_bucket_view' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_lov_project_risk_bucket_view a113
 on (a11.project_risk_color_key=a113.row_key)
union
select'ldb.d_lov_project_schedule_variance_bucket_view' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_lov_project_schedule_variance_bucket_view a114
 on (a11.schedule_variance_color_key=a114.row_key)
union
select'ldb.d_calendar_week' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_calendar_week a115
 on (a11.n_key=a115.row_key)
union
select'ldb.d_project_parent_project' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_project a12
 on (a11.project_key=a12.row_key)
 join ldb.d_project_parent_project a116
 on (a12.parent_project_key=a116.row_key)
union
select'ldb.d_lov_project_state_view' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_project a12
 on (a11.project_key=a12.row_key)
 join ldb.d_lov_project_state_view a117
 on (a12.project_state_src_key=a117.row_key)
union
select'ldb.d_lov_project_priority_view' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_project a12
 on (a11.project_key=a12.row_key)
 join ldb.d_lov_project_priority_view a118
 on (a12.project_priority_src_key=a118.row_key)
union
select'ldb.d_lov_project_risk_view' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_project a12
 on (a11.project_key=a12.row_key)
 join ldb.d_lov_project_risk_view a119
 on (a12.project_risk_src_key=a119.row_key)
union
select'ldb.d_lov_portfolio_category_view' as Table_Name,count(a11.row_key) Row_Count
 from  ldb.f_n_project_task_weekly a11
 join ldb.d_project a12
 on (a11.project_key=a12.row_key)
 join ldb.d_project_top_project a13
 on (a12.top_project_key=a13.row_key)
 join ldb.d_portfolio a14
 on (a13.portfolio_key=a14.row_key)
 join ldb.d_lov_portfolio_category_view a120
 on (a14.portfolio_category_src_key=a120.row_key);
