 select 'ldb.f_change_failure' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
union 
 select'ldb.d_change_failure' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
union 
 select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
join ldb.d_calendar_date a13
on (a11.date_key=a13.row_key)
union 
 select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
join ldb.d_configuration_item a14
on (a11.ci_key=a14.row_key)
union 
 select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
join ldb.d_change_request a15
on (a11.change_request_key=a15.row_key)
union 
 select'ldb.d_internal_contact_programmer_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
join ldb.d_internal_contact_programmer_c a16
on (a11.programmer_c_key=a16.row_key)
union 
 select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
join ldb.d_internal_contact_assigned_to a17
on (a11.assigned_to_key=a17.row_key)
union 
 select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
join ldb.d_internal_organization_group a18
on (a11.assignment_group_key=a18.row_key)
union 
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
 join ldb.d_calendar_date a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_month a19
on (a13.month_start_date_key=a19.row_key)
union
select'ldb.d_lov_impact_capacity_plan_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
 join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_impact_capacity_plan_c a110
on (a12.impact_capacity_plan_src_c_key=a110.row_key)
union
select'ldb.d_lov_impact_security_controls_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
 join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_impact_security_controls_c a111
on (a12.impact_security_controls_c_key=a111.row_key)
union
select'ldb.d_lov_template_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
 join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_template_type_c a112
on (a12.template_type_c_key=a112.row_key)
union 
select'ldb.d_lov_tier_4_restricted_access_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
 join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_tier_4_restricted_access_c a113
on (a12.tier_4_restricted_access_src_c_key=a113.row_key)
union
select'ldb.d_change_request_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
 join ldb.d_change_request a15
on (a11.change_request_key=a15.row_key)
join ldb.d_change_request_close_code a114
on (a15.close_code_src_key=a114.row_key)
union
select'ldb.d_lov_change_trigger_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
 join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_change_trigger_c a115
on (a12.change_trigger_src_c_key=a115.row_key)
union
select'ldb.d_lov_change_request_conflict_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
  join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_change_request_conflict_status_c a116
on (a12.conflict_status_src_c_key=a116.row_key)
union
select'ldb.d_lov_change_environment_details_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
  join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_change_environment_details_c a117
on (a12.environment_details_src_c_key=a117.row_key)
union
select'ldb.d_lov_change_request_fsc_service_required_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
  join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_change_request_fsc_service_required_c a118
on (a12.fsc_services_required_src_c_key=a118.row_key)
union
select'ldb.d_lov_change_impact_continuity_plan_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
 join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_change_impact_continuity_plan_c a119
on (a12.impact_continuity_plan_src_c_key=a119.row_key)
union
select'ldb.d_lov_change_impact_availability_plan_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
  join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_change_impact_availability_plan_c a120
on (a12.impact_availability_plan_src_c_key=a120.row_key)
union
select'ldb.d_lov_change_is_application_outage_required_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
 join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_change_is_application_outage_required_c a121
on (a12.is_application_outage_required_src_c_key=a121.row_key)
union
select'ldb.d_lov_change_server_outage_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
  join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_change_server_outage_c a122
on (a12.server_outage_src_c_key=a122.row_key)
union
select'ldb.d_lov_change_mf_online_inst_newcopy_met_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
 join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_change_mf_online_inst_newcopy_met_c a123
on (a12.mf_online_inst_newcopy_met_src_c_key=a123.row_key)
union
select'ldb.d_lov_change_reason_for_application_outage_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_failure a11 
  join ldb.d_change_failure a12
on (a11.change_failure_key=a12.row_key)
join ldb.d_lov_change_reason_for_application_outage_c a124
on (a12.reason_for_application_outage_src_c_key=a124.row_key)