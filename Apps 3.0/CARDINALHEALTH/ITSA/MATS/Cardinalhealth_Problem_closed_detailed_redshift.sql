select'ldb.f_problem_closed_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
union	
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_problem       a12	
on (a11.problem_key=a12.row_key)	
union	
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_internal_contact a13	
on (a11.opened_by_key = a13.row_key)	
union	
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_calendar_time       a14	
on (a11.opened_time_key=a14.row_key)	
union	
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_calendar_date       a15	
on (a11.closed_on_key=a15.row_key)	
union	
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11	
 join ldb.d_calendar_date       a15	
on (a11.closed_on_key=a15.row_key)	
join ldb.d_calendar_month       a16	
on (a15.month_start_date_key=a16.row_key)	
union	
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_internal_organization_group       a17	
on (a11.assignment_group_key=a17.row_key)	
union	
select'ldb.d_internal_contact_emp_seniors_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
 join ldb.d_internal_organization_group       a17	
on (a11.assignment_group_key=a17.row_key)	
join ldb.d_internal_contact_emp_seniors_c       a18	
on (a17.manager_c_key=a18.row_key)	
union	
select'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_assignment_group_level0_manager_c_relation       a19	
on (a11.assignment_group_key=a19.level0_assigment_group_key)	
union	
select'ldb.d_internal_organization_causal_assignment_group_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_internal_organization_causal_assignment_group_c       a110	
on (a11.causal_assignment_group_c_key=a110.row_key)	
union	
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_calendar_greg_fiscal_c       a112	
on (a11.closed_on_key=a112.greogrian_calendar_key)	
union	
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
 join ldb.d_calendar_greg_fiscal_c       a112	
on (a11.closed_on_key=a112.greogrian_calendar_key)	
join ldb.d_calendar_date_fiscal       a113	
on (a112.fiscal_key=a113.row_key)	
union	
select'ldb.d_configuation_item_affected_ci_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_configuation_item_affected_ci_c       a114	
on (a11.affected_configuration_item_c_key=a114.row_key)	
union	
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_internal_contact_assigned_to       a115	
on (a11.assigned_to_key=a115.row_key)	
union	
select'ldb.d_lov_problem_complexity_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_lov_problem_complexity_c       a116	
on (a11.complexity_src_c_key=a116.row_key)	
union	
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_configuration_item       a117	
on (a11.configuration_item_key=a117.row_key)	
union	
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
 join ldb.d_internal_contact a13	
on (a11.opened_by_key = a13.row_key)	
join ldb.d_internal_contact_mdm       a118	
on (a13.row_current_key=a118.row_current_key)	
union	
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
 join ldb.d_calendar_time       a14	
on (a11.opened_time_key=a14.row_key)	
join ldb.d_calendar_time_hour       a119	
on (a14.hour_24_format_num=a119.hour_24_format_num)	
union	
select'ldb.d_lov_known_error_status_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_lov_known_error_status_c       a120	
on (a11.known_error_status_c_key=a120.row_key)	
union	
select'ldb.d_internal_contact_problem_manager_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_internal_contact_problem_manager_c       a121	
on (a11.problem_manager_c_key=a121.row_key)	
union	
select'ldb.d_problem_priority' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_problem_priority       a122	
on (a11.priority_src_key=a122.row_key)	
union	
select'ldb.d_problem_reported_type' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_problem_reported_type       a123	
on (a11.reported_type_src_key=a123.row_key)	
union	
select'ldb.d_problem_state' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_problem_state       a124	
on (a11.state_src_key=a124.row_key)	
union	
select'ldb.d_problem_urgency' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_problem_urgency       a125	
on (a11.urgency_src_key=a125.row_key)	
union	
select'ldb.d_internal_contact_requested_for_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_internal_contact_requested_for_c       a125	
on (a11.requested_for_c_key=a125.row_key)	
union	
select'ldb.d_lov_problem_business_segment_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_lov_problem_business_segment_c       a125	
on (a11.root_cause_business_segment_c_key=a125.row_key)	
union	
select'ldb.d_change_request_caused_change_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_change_request_caused_change_c       a125	
on (a11.caused_by_change_c_key=a125.row_key)	
union	
select'ldb.d_change_request_rfc_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_change_request_rfc_c       a125	
on (a11.rfc_c_key=a125.row_key)	
union	
select'ldb.d_rm_status_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_rm_status_c       a125	
on (a11.status_rm_src_c_key=a125.row_key)	
union	
select'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
 join ldb.d_assignment_group_level0_manager_c_relation       a19	
on (a11.assignment_group_key=a19.level0_assigment_group_key)	
join ldb.d_assignment_group_level0_manager_c       a125	
on (a19.level0_manager_c_key=a125.level0_manager_c_key)	
union	
select'ldb.d_internal_contact_causal_assignment_group_director_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_internal_organization_causal_assignment_group_c       a110	
on (a11.causal_assignment_group_c_key=a110.row_key)	
join ldb.d_internal_contact_causal_assignment_group_director_c       a125	
on (a110.director_c_key=a125.row_key)	
union	
select'ldb.d_internal_contact_assignment_grp_manager_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_internal_organization_causal_assignment_group_c       a110	
on (a11.causal_assignment_group_c_key=a110.row_key)	
join ldb.d_internal_contact_assignment_grp_manager_c       a125	
on (a110.manager_c_key=a125.row_key)	
union	
select'ldb.d_internal_contact_causal_assignment_group_vp_c' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_internal_organization_causal_assignment_group_c       a110	
on (a11.causal_assignment_group_c_key=a110.row_key)	
join ldb.d_internal_contact_causal_assignment_group_vp_c       a125	
on (a110.vp_c_key=a125.row_key)	
union	
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_calendar_greg_fiscal_c       a112	
on (a11.closed_on_key=a112.greogrian_calendar_key)	
join ldb.d_calendar_date_fiscal       a113	
on (a112.fiscal_key=a113.row_key)	
join ldb.d_calendar_fiscal_period       a125	
on (a113.period_start_date_key=a125.row_key)	
union	
select'ldb.d_calendar_fiscal_quarter' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_calendar_greg_fiscal_c       a112	
on (a11.closed_on_key=a112.greogrian_calendar_key)	
join ldb.d_calendar_date_fiscal       a113	
on (a112.fiscal_key=a113.row_key)	
join ldb.d_calendar_fiscal_quarter       a125	
on (a113.quarter_start_date_key=a125.row_key)	
union	
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count	
 from  ldb.f_problem_closed_c       a11 	
join ldb.d_calendar_greg_fiscal_c       a112	
on (a11.closed_on_key=a112.greogrian_calendar_key)	
join ldb.d_calendar_date_fiscal       a113	
on (a112.fiscal_key=a113.row_key)	
join ldb.d_calendar_fiscal_year       a125	
on (a113.year_start_date_key=a125.row_key)	
