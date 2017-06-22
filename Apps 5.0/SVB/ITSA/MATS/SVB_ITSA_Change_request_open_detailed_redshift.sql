select 'ldb.f_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request       a12
on (a11.change_request_key=a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_contact       a13
on (a11.opened_by_key=a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_calendar_date       a14
on (a11.opened_on_key=a14.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_calendar_date       a14
on (a11.opened_on_key=a14.row_key)
join ldb.d_calendar_year       a15
on (a14.year_start_date_key=a15.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_calendar_date       a14
on (a11.opened_on_key=a14.row_key)
join ldb.d_calendar_week       a16
on (a14.week_start_date_key=a16.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_contact_assigned_to       a17
on (a11.assigned_to_key=a17.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_organization_group       a18
on (a11.assignment_group_key=a18.row_key)
union
select'ldb.d_change_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_category       a19
on (a11.category_src_key=a19.row_key)
union
select'ldb.d_change_request_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_reported_type       a110
on (a11.reported_type_src_key=a110.row_key)
union
select'ldb.d_change_request_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_impact       a111
on (a11.impact_src_key=a111.row_key)
union
select'ldb.d_change_request_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_priority       a112
on (a11.priority_src_key=a112.row_key)
union
select'ldb.d_change_request_reason' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_reason       a113
on (a11.reason_src_key=a113.row_key)
union
select'ldb.d_configuration_item_change_request_application_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_configuration_item_change_request_application_c       a114
on (a11.configuration_item_application_c_key=a114.row_key)
union
select'ldb.d_lov_change_request_closure_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_lov_change_request_closure_status_c       a115
on (a11.closure_code_src_c_key=a115.row_key)
union
select'ldb.d_change_request_risk' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_risk       a116
on (a11.risk_src_key=a116.row_key)
union
select'ldb.d_change_request_scope' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_scope       a117
on (a11.scope_src_key=a117.row_key)
union
select'ldb.d_change_request_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_state       a118
on (a11.state_src_key=a118.row_key)
union
select'ldb.d_change_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_type       a119
on (a11.type_src_key=a119.row_key)
union
select'ldb.d_change_request_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_urgency       a120
on (a11.urgency_src_key=a120.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_configuration_item       a121
on (a11.configuration_item_key=a121.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_organization_department       a122
on (a11.requested_by_department_key=a122.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_domain       a123
on (a11.domain_key=a123.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_internal_contact       a13
on (a11.opened_by_key=a13.row_key)
join ldb.d_internal_contact_mdm       a124
on (a13.row_current_key=a124.row_current_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_location       a125
on (a11.location_key=a125.row_key)
union
select'ldb.d_lov_change_request_unplanned_impact_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_change_request       a12
on (a11.change_request_key=a12.row_key)
join ldb.d_lov_change_request_unplanned_impact_c       a126
on (a12.unplanned_impact_c_key=a126.row_key)
union
select'ldb.d_lov_change_request_closure_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_change_request       a12
on (a11.change_request_key=a12.row_key)
join ldb.d_lov_change_request_closure_code_c       a127
on (a12.closure_code_c_key=a127.row_key)
union
select'ldb.d_lov_change_request_expedite_reason_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11
 join ldb.d_change_request       a12
on (a11.change_request_key=a12.row_key)
join ldb.d_lov_change_request_expedite_reason_c       a128
on (a12.expedite_reason_c_key=a128.row_key)
union
select'ldb.d_lov_change_request_phase_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_change_request       a12
on (a11.change_request_key=a12.row_key)
join ldb.d_lov_change_request_phase_state_c       a129
on (a12.phase_state_c_key=a129.row_key)
union
select'ldb.d_lov_change_request_phase_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_change_request       a12
on (a11.change_request_key=a12.row_key)
join ldb.d_lov_change_request_phase_c       a130
on (a12.phase_c_key=a130.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_calendar_date       a14
on (a11.opened_on_key=a14.row_key)
join ldb.d_calendar_month       a131
on (a14.month_start_date_key=a131.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11
 join ldb.d_calendar_date       a14
on (a11.opened_on_key=a14.row_key)
join ldb.d_calendar_quarter       a132
on (a14.quarter_start_date_key=a132.row_key)



