select'ldb.f_defect_rm_closed_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key=a12.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key=a13.row_key)
union
select'ldb.d_internal_contact_emp_seniors_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
 join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key=a13.row_key)
join ldb.d_internal_contact_emp_seniors_c       a14
on (a13.manager_c_key=a14.row_key)
union
select'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_assignment_group_level0_manager_c_relation       a15
on (a11.assignment_group_key=a15.level0_assigment_group_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_calendar_date       a16
on (a11.closed_on_key=a16.row_key)
union
select'ldb.d_defect_rm_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_defect_rm_c       a17
on (a11.defect_c_key=a17.row_key)
union
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_calendar_greg_fiscal_c       a18
on (a11.closed_on_key=a18.greogrian_calendar_key)
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11
 join ldb.d_calendar_greg_fiscal_c       a18
on (a11.closed_on_key=a18.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a19
on (a18.fiscal_key=a19.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_internal_contact_assigned_to       a110
on (a11.assigned_to_key=a110.row_key)
union
select'ldb.d_rm_change_scope_feature_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_rm_change_scope_feature_c       a111
on (a11.feature_change_scope_c_key=a111.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_configuration_item       a112
on (a11.configuration_item_key=a112.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
 join ldb.d_internal_contact       a12
on (a11.opened_by_key=a12.row_key)
join ldb.d_internal_contact_mdm       a113
on (a12.row_current_key=a113.row_current_key)
union
select'ldb.d_internal_contact_requested_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_internal_contact_requested_for       a114
on (a11.requestor_c_key=a114.row_key)
union
select'ldb.d_rm_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_rm_status_c       a115
on (a11.status_rm_src_c_key=a115.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_internal_contact_task_closed_by       a116
on (a11.closed_by_key=a116.row_key)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_task_impact       a117
on (a11.impact_src_key=a117.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_location       a118
on (a11.location_key=a118.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_task_priority       a119
on (a11.priority_src_key=a119.row_key)
union
select'ldb.d_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_task_state       a120
on (a11.state_src_key=a120.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_task_urgency       a121
on (a11.urgency_src_key=a121.row_key)
union
select'ldb.d_rm_lov_type_of_request_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
join ldb.d_rm_lov_type_of_request_c       a122
on (a11.type_of_request_c_key=a122.row_key)
union
select'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11
 join ldb.d_assignment_group_level0_manager_c_relation       a15
on (a11.assignment_group_key=a15.level0_assigment_group_key)
join ldb.d_assignment_group_level0_manager_c       a123
on (a15.level0_manager_c_key=a123.level0_manager_c_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
 join ldb.d_calendar_date       a16
on (a11.closed_on_key=a16.row_key)
join ldb.d_calendar_month       a125
on (a16.month_start_date_key=a125.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
 join ldb.d_calendar_date       a16
on (a11.closed_on_key=a16.row_key)
join ldb.d_calendar_week       a126
on (a16.week_start_date_key=a126.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
 join ldb.d_calendar_date       a16
on (a11.closed_on_key=a16.row_key)
join ldb.d_calendar_quarter       a128
on (a16.quarter_start_date_key =  a128.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
 join ldb.d_calendar_date       a16
on (a11.closed_on_key=a16.row_key)
join ldb.d_calendar_year       a130
on (a16.year_start_date_key=a130.row_key)
union
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
 join ldb.d_calendar_greg_fiscal_c       a18
on (a11.closed_on_key=a18.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a19
on (a18.fiscal_key=a19.row_key)
join ldb.d_calendar_fiscal_period       a124
on (a19.period_start_date_key=a124.row_key)
union
select'ldb.d_calendar_fiscal_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
 join ldb.d_calendar_greg_fiscal_c       a18
on (a11.closed_on_key=a18.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a19
on (a18.fiscal_key=a19.row_key)
join ldb.d_calendar_fiscal_quarter       a127
on (a19.quarter_start_date_key=a127.row_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_defect_rm_closed_c       a11 
 join ldb.d_calendar_greg_fiscal_c       a18
on (a11.closed_on_key=a18.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a19
on (a18.fiscal_key=a19.row_key)
join ldb.d_calendar_fiscal_year       a129
on (a19.year_start_date_key=a129.row_key)





