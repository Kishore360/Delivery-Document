select 'ldb.f_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
union
select'ldb.d_parent_change_request_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_parent_change_request_c       a14
on (a11.parent_change_request_key = a14.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_contact_assigned_to       a15
on (a11.assigned_to_key = a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_calendar_date       a16
on (a11.opened_on_key = a16.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request       a17
on (a11.change_request_key = a17.row_key)
union
select'ldb.d_internal_contact_closed_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_contact_closed_by_c       a18
on (a11.closed_by_key = a18.row_key)
union
select'ldb.d_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_contact_opened_by_c       a19
on (a11.opened_by_key = a19.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_calendar_date       a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_month       a110
on (a16.month_start_date_key = a110.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_organization_group       a111
on (a11.assignment_group_key = a111.row_key)
union
select'ldb.d_change_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_category       a112
on (a11.category_src_key = a112.row_key)
union
select'ldb.d_change_request_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_reported_type       a113
on (a11.reported_type_src_key = a113.row_key)
union
select'ldb.d_internal_contact_change_owner_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_contact_change_owner_c       a114
on (a11.change_owner_c_key = a114.row_key)
union
select'ldb.d_change_request_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_priority       a115
on (a11.priority_src_key = a115.row_key)
union
select'ldb.d_change_request_reason' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_reason       a116
on (a11.reason_src_key = a116.row_key)
union
select'ldb.d_lov_change_request_impact_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_lov_change_request_impact_c       a117
on (a11.impact_src_key = a117.row_key)
union
select'ldb.d_change_request_review_status' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_review_status       a118
on (a11.review_status_src_key = a118.row_key)
union
select'ldb.d_change_request_risk' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_risk       a119
on (a11.risk_src_key = a119.row_key)
union
select'ldb.d_change_request_scope' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_scope       a120
on (a11.scope_src_key = a120.row_key)
union
select'ldb.d_change_request_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_state       a121
on (a11.state_src_key = a121.row_key)
union
select'ldb.d_change_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_type       a122
on (a11.type_src_key = a122.row_key)
union
select'ldb.d_change_request_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_urgency       a123
on (a11.urgency_src_key = a123.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_configuration_item       a124
on (a11.configuration_item_key = a124.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_organization_department       a125
on (a11.requested_by_department_key = a125.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_domain       a126
on (a11.domain_key = a126.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11
 join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm       a127
on (a12.row_current_key = a127.row_current_key)
union
select'ldb.d_lov_change_request_environment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_lov_change_request_environment_c       a128
on (a11.environment_src_c_key = a128.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
join ldb.d_calendar_time_hour       a129
on (a13.hour_24_format_num = a129.hour_24_format_num)
union
select'ldb.d_lov_includes_data_change_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_lov_includes_data_change_c       a130
on (a11.includes_data_change_c_key = a130.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_location       a131
on (a11.location_key = a131.row_key)
union
select'ldb.d_lov_change_request_non_prod_environment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_lov_change_request_non_prod_environment_c       a132
on (a11.non_prod_env_src_c_key = a132.row_key)
union
select'ldb.d_lov_change_request_parent_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11
 join ldb.d_parent_change_request_c       a14
on (a11.parent_change_request_key = a14.row_key)
join ldb.d_lov_change_request_parent_state       a133
on (a14.parent_state_src_key = a133.row_key)
union
select'ldb.o_data_freshness' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.o_data_freshness       a134
on (a11.source_id = a134.source_id)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11
 join ldb.d_calendar_date       a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_week       a135
on (a16.week_start_date_key = a135.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_calendar_date       a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_quarter       a138
on (a16.quarter_start_date_key = a138.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_calendar_date       a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_year       a139
on (a16.year_start_date_key = a139.row_key)
union
select'ldb.d_internal_contact_closed_by_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_internal_contact_closed_by_c       a18
on (a11.closed_by_key = a18.row_key)
join ldb.d_internal_contact_closed_by_manager_c       a136
on (a18.manager_c_key = a136.row_key)
union
select'ldb.d_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_internal_contact_opened_by_c       a19
on (a11.opened_by_key = a19.row_key)
join ldb.d_internal_contact_manager_c       a137
on (a19.manager_c_key = a137.row_key)






