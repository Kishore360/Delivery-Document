select'ldb.f_change_request_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request       a12
on (a11.change_request_key=a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_contact       a13
on (a11.opened_by_key=a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
union
select'ldb.d_internal_contact_emp_seniors_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
join ldb.d_internal_contact_emp_seniors_c       a15
on (a14.manager_c_key=a15.row_key)
union
select'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_assignment_group_level0_manager_c_relation       a16
on (a11.assignment_group_key=a16.level0_assigment_group_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_calendar_date       a17
on (a11.closed_on_key=a17.row_key)
union
select'ldb.d_internal_organization_causal_assignment_group_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_causal_assignment_group_c       a18
on (a11.causal_assignment_group_c_key=a18.row_key)
union
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_calendar_greg_fiscal_c       a19
on (a11.closed_on_key=a19.greogrian_calendar_key)
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_calendar_greg_fiscal_c       a19
on (a11.closed_on_key=a19.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a110
on (a19.fiscal_key=a110.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_contact_assigned_to       a111
on (a11.assigned_to_key=a111.row_key)
union
select'ldb.d_change_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_category       a112
on (a11.category_src_key=a112.row_key)
union
select'ldb.d_change_request_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_impact       a113
on (a11.impact_src_key=a113.row_key)
union
select'ldb.d_change_request_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_priority       a114
on (a11.priority_src_key=a114.row_key)
union
select'ldb.d_change_request_reason' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_reason       a115
on (a11.reason_src_key=a115.row_key)
union
select'ldb.d_change_request_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_reported_type       a116
on (a11.reported_type_src_key=a116.row_key)
union
select'ldb.d_change_request_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_state       a117
on (a11.state_src_key=a117.row_key)
union
select'ldb.d_change_request_review_status' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_review_status       a118
on (a11.review_status_src_key=a118.row_key)
union
select'ldb.d_change_request_risk' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_risk       a119
on (a11.risk_src_key=a119.row_key)
union
select'ldb.d_change_request_scope' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_scope       a120
on (a11.scope_src_key=a120.row_key)
union
select'ldb.d_change_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_type       a121
on (a11.type_src_key=a121.row_key)
union
select'ldb.d_change_request_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_urgency       a122
on (a11.urgency_src_key=a122.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_configuration_item       a123
on (a11.configuration_item_key=a123.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_department       a124
on (a11.requested_by_department_key=a124.row_key)
union
select'ldb.d_change_request_lov_deployment_reason_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_lov_deployment_reason_c       a125
on (a11.deployment_reason_c_key=a125.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_domain       a126
on (a11.domain_key=a126.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_internal_contact       a13
on (a11.opened_by_key=a13.row_key)
join ldb.d_internal_contact_mdm       a127
on (a13.row_current_key=a127.row_current_key)
union
select'ldb.d_change_request_lov_stage_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_lov_stage_c       a128
on (a11.stage_src_c_key=a128.row_key)
union
select'ldb.d_change_request_lov_standard_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_lov_standard_status_c       a129
on (a11.standard_status_c_key=a129.row_key)
union
select'ldb.d_change_request_lov_subcategory_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_lov_subcategory_c       a130
on (a11.subcategory_c_key=a130.row_key)
union
select'ldb.d_change_request_lov_success_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_lov_success_state_c       a131
on (a11.success_status_c_key=a131.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_location       a132
on (a11.location_key=a132.row_key)
union
select'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_assignment_group_level0_manager_c_relation       a16
on (a11.assignment_group_key=a16.level0_assigment_group_key)
join ldb.d_assignment_group_level0_manager_c       a133
on (a16.level0_manager_c_key=a133.level0_manager_c_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11
 join ldb.d_calendar_date       a17
on (a11.closed_on_key=a17.row_key)
join ldb.d_calendar_month       a139
on (a17.month_start_date_key=a139.row_key)
union
select'ldb.d_internal_contact_causal_assignment_group_director_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_internal_organization_causal_assignment_group_c       a18
on (a11.causal_assignment_group_c_key=a18.row_key)
join ldb.d_internal_contact_causal_assignment_group_director_c       a134
on (a18.director_c_key=a134.row_key)
union
select'ldb.d_internal_contact_assignment_grp_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11
 join ldb.d_internal_organization_causal_assignment_group_c       a18
on (a11.causal_assignment_group_c_key=a18.row_key)
join ldb.d_internal_contact_assignment_grp_manager_c       a135
on (a18.manager_c_key=a135.row_key)
union
select'ldb.d_internal_contact_causal_assignment_group_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_internal_organization_causal_assignment_group_c       a18
on (a11.causal_assignment_group_c_key=a18.row_key)
join ldb.d_internal_contact_causal_assignment_group_vp_c       a136
on (a18.vp_c_key=a136.row_key)
union
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11
  join ldb.d_calendar_greg_fiscal_c       a19
on (a11.closed_on_key=a19.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a110
on (a19.fiscal_key=a110.row_key)
join ldb.d_calendar_fiscal_period       a138
on (a110.period_start_date_key=a138.row_key)
union
select'ldb.d_calendar_fiscal_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
  join ldb.d_calendar_greg_fiscal_c       a19
on (a11.closed_on_key=a19.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a110
on (a19.fiscal_key=a110.row_key)
join ldb.d_calendar_fiscal_quarter       a140
on (a110.quarter_start_date_key=a140.row_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
  join ldb.d_calendar_greg_fiscal_c       a19
on (a11.closed_on_key=a19.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a110
on (a19.fiscal_key=a110.row_key)
join ldb.d_calendar_fiscal_year       a141
on (a110.year_start_date_key=a141.row_key)






