select 'ldb.f_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
union
select'ldb.d_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_project       a12
on (a11.project_key = a12.row_key)
union
select'ldb.d_application' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_application       a13
on (a11.application_key = a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_calendar_date       a14
on (a11.date_key = a14.row_key)
union
select'ldb.d_project_parent_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_project_parent_project       a15
on (a12.parent_project_key = a15.row_key)
union
select'ldb.d_lov_project_state_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_state_view       a17
on (a12.project_state_src_key = a17.row_key)
union
select'ldb.d_project_top_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_project_top_project       a18
on (a12.top_project_key = a18.row_key)
union
select'ldb.d_lov_project_approval_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_approval_view       a125
on (a12.project_approval_src_key = a125.row_key)
union
select'ldb.d_lov_project_business_alignment_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_business_alignment_view       a126
on (a12.project_business_alignment_src_key = a126.row_key)
union
select'ldb.d_lov_project_contact_type_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_contact_type_view       a127
on (a12.project_contact_type_src_key = a127.row_key)
union
select'ldb.d_lov_project_escalation_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_escalation_view       a128
on (a12.project_escalation_src_key = a128.row_key)
union
select'ldb.d_lov_project_goal_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_goal_view       a129
on (a12.project_goal_src_key = a129.row_key)
union
select'ldb.d_lov_project_impact_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_impact_view       a130
on (a12.project_impact_src_key = a130.row_key)
union
select'ldb.d_internal_contact_project_management_office' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_internal_contact_project_management_office       a131
on (a12.project_management_office_key = a131.row_key)
union
select'ldb.d_lov_project_phase_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_phase_view       a132
on (a12.project_phase_src_key = a132.row_key)
union
select'ldb.d_lov_project_phase_type_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_phase_type_view       a133
on (a12.project_phase_type_src_key = a133.row_key)
union
select'ldb.d_lov_project_priority_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_priority_view       a134
on (a12.project_priority_src_key = a134.row_key)
union
select'ldb.d_lov_project_risk_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_risk_view       a135
on (a12.project_risk_src_key = a135.row_key)
union
select'ldb.d_lov_project_urgency_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_urgency_view       a136
on (a12.project_urgency_src_key = a136.row_key)
union
select'ldb.d_lov_project_work_status_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_project       a12
on (a11.project_key = a12.row_key)
join ldb.d_lov_project_work_status_view       a137
on (a12.project_work_status_src_key = a137.row_key)
union
select'ldb.d_portfolio' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_portfolio       a16
on (a11.portfolio_key = a16.row_key)
union
select'ldb.d_application_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_application       a13
on (a11.application_key = a13.row_key)
join ldb.d_application_mdm       a19
on (a13.mdm_key = a19.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_business_service       a110
on (a11.business_service_key = a110.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_internal_organization_legalentity       a111
on (a11.company_key = a111.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_configuration_item       a112
on (a11.configuration_item_key = a112.row_key)
union
select'ldb.d_demand' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_demand       a113
on (a11.demand_key = a113.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_domain       a114
on (a11.domain_key = a114.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_location       a115
on (a11.location_key = a115.row_key)
union
select'ldb.d_program' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_program       a116
on (a11.program_key = a116.row_key)
union
select'ldb.d_lov_project_cost_variance_bucket_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_lov_project_cost_variance_bucket_view       a117
on (a11.cost_variance_color_key = a117.row_key)
union
select'ldb.d_lov_project_effort_variance_bucket_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_lov_project_effort_variance_bucket_view       a118
on (a11.effort_variance_color_key = a118.row_key)
union
select'ldb.d_internal_contact_project_manager' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_internal_contact_project_manager       a119
on (a11.project_manager_key = a119.row_key)
union
select'ldb.d_lov_project_weeks_to_due_date_bucket_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_lov_project_weeks_to_due_date_bucket_view       a120
on (a11.weeks_to_due_date_bucket_key = a120.row_key)
union
select'ldb.d_lov_project_risk_bucket_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_lov_project_risk_bucket_view       a121
on (a11.project_risk_color_key = a121.row_key)
union
select'ldb.d_lov_project_schedule_variance_bucket_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
join ldb.d_lov_project_schedule_variance_bucket_view       a122
on (a11.schedule_variance_color_key = a122.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_calendar_date       a14
on (a11.date_key = a14.row_key)
join ldb.d_calendar_month       a123
on (a14.month_start_date_key = a123.row_key)
union
select'ldb.d_lov_portfolio_category_view' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_project       a11 
 join ldb.d_portfolio       a16
on (a11.portfolio_key = a16.row_key)
join ldb.d_lov_portfolio_category_view       a124
on (a16.portfolio_category_src_key = a124.row_key)




