select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_change_request_caused_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_change_request_caused_by       a12
on (a11.caused_by_change_key = a12.row_key)
union
select'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_customer       a13
on (a11.customer_key = a13.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact       a14
on (a11.opened_by_key = a14.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_time       a15
on (a11.opened_time_key = a15.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_location       a16
on (a11.location_key = a16.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_business_service       a17
on (a11.business_service_key = a17.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item       a110
on (a11.configuration_item_key = a110.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_month       a111
on (a18.month_start_date_key = a111.row_key)
union
select'ldb.d_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_opened_by_c       a112
on (a11.opened_by_key = a112.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_problem       a113
on (a11.problem_key = a113.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_assigned_to       a114
on (a11.assigned_to_key = a114.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_group       a115
on (a11.assignment_group_key = a115.row_key)
union
select'ldb.d_incident_call_back_for_ticket_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_call_back_for_ticket_c       a116
on (a11.call_back_for_ticket_c_key = a116.row_key)
union
select'ldb.d_internal_contact_caller_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_caller_c       a117
on (a11.caller_c_key = a117.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_change_request       a118
on (a11.change_request_key = a118.row_key)
union
select'ldb.d_internal_contact_closed_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_closed_by_c       a119
on (a11.closed_by_key = a119.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_legalentity       a120
on (a11.company_key = a120.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_customer       a13
on (a11.customer_key = a13.row_key)
join ldb.d_customer_mdm       a121
on (a13.row_current_key = a121.row_current_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_contact       a14
on (a11.opened_by_key = a14.row_key)
join ldb.d_internal_organization_department       a122
on (a14.department_key = a122.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_domain       a123
on (a11.domain_key = a123.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_time       a15
on (a11.opened_time_key = a15.row_key)
join ldb.d_calendar_time_hour       a124
on (a15.hour_24_format_num = a124.hour_24_format_num)
union
select'ldb.d_incident_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_contacttype       a125
on (a11.reported_type_src_key = a125.row_key)
union
select'ldb.d_incident_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_impact       a126
on (a11.impact_src_key = a126.row_key)
union
select'ldb.d_incident_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_urgency       a127
on (a11.urgency_src_key = a127.row_key)
union
select'ldb.d_lov_line_of_business_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_line_of_business_c       a128
on (a11.line_of_business_src_c_key = a128.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact       a129
on (a11.last_resolved_by_key = a129.row_key)
union
select'ldb.d_lov_escalation_view_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_lov_escalation_view_c       a130
on (a11.escalation_c_key = a130.row_key)
union
select'ldb.o_data_freshness' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.o_data_freshness       a131
on (a11.source_id = a131.source_id)
union
select'ldb.d_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_business_service       a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_criticality       a132
on (a17.criticality_key = a132.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_week       a133
on (a18.week_start_date_key = a133.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_quarter       a143
on (a18.quarter_start_date_key = a143.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_year       a144
on (a18.year_start_date_key = a144.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_category       a134
on (a19.category_src_key = a134.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_close_code       a135
on (a19.close_code_src_key = a135.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_priority       a136
on (a19.priority_src_key = a136.row_key)
union
select'ldb.d_task_sla_resolution_flag' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_task_sla_resolution_flag       a137
on (a19.met_resolution_sla_flag_key = a137.row_key)
union
select'ldb.d_task_sla_response_flag' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_task_sla_response_flag       a138
on (a19.met_response_sla_flag_key = a138.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_severity       a139
on (a19.severity_src_key = a139.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_state       a140
on (a19.state_src_key = a140.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_subcategory       a141
on (a19.sub_category_src_key = a141.row_key)
union
select'ldb.d_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_internal_contact_opened_by_c       a112
on (a11.opened_by_key = a112.row_key)
join ldb.d_internal_contact_manager_c       a142
on (a112.manager_c_key = a142.row_key)





