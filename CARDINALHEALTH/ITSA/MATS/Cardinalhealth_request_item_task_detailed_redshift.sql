select'ldb.f_request_item_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_internal_contact       a13
on (a11.ritm_opened_by_key=a13.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_master_item       a14
on (a11.ritm_catalog_item_key=a14.row_key)

union
select'ldb.d_internal_contact_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_internal_contact_rt_c       a16
on (a11.opened_by_key=a16.row_key)
union
select'ldb.d_calendar_date_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_calendar_date_rt_c       a17
on (a11.opened_on_key=a17.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_internal_organization_group       a18
on (a11.assignment_group_key=a18.row_key)
union
select'ldb.d_internal_contact_emp_seniors_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
 left outer join ldb.d_internal_organization_group       a18
on (a11.assignment_group_key=a18.row_key)
left outer join ldb.d_internal_contact_emp_seniors_c       a19
on (a18.manager_c_key=a19.row_key)
union
select'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_assignment_group_level0_manager_c_relation       a110
on (a11.assignment_group_key=a110.level0_assigment_group_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_request_item       a111
on (a11.ritm_request_item_key=a111.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_calendar_date       a112
on (a11.ritm_opened_on_key=a112.row_key)
union
select'ldb.d_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_request_task       a113
on (a11.request_task_key=a113.row_key)
union
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_calendar_greg_fiscal_c       a114
on (a11.ritm_opened_on_key=a114.greogrian_calendar_key)
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
 left outer join ldb.d_calendar_greg_fiscal_c       a114
on (a11.ritm_opened_on_key=a114.greogrian_calendar_key)
left outer join ldb.d_calendar_date_fiscal       a115
on (a114.fiscal_key=a115.row_key)
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_request       a116
on (a11.ritm_request_key=a116.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_internal_contact_assigned_to       a117
on (a11.ritm_assigned_to_key=a117.row_key)
union
select'ldb.d_request_item_lov_catalog_item_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_request_item_lov_catalog_item_c       a118
on (a11.ritm_catalog_item_c_key=a118.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
 left outer join ldb.d_internal_contact       a13
on (a11.ritm_opened_by_key=a13.row_key)
left outer join ldb.d_internal_contact_mdm       a119
on (a13.row_current_key=a119.row_current_key)
union
select'ldb.d_sc_req_item_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_sc_req_item_approval       a120
on (a11.ritm_approval_state_src_key=a120.row_key)
union
select'ldb.d_internal_organization_group_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_internal_organization_group_rt_c       a121
on (a11.ritm_assignment_group_key=a121.row_key)
union
select'ldb.d_request_item_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_request_item_stage       a122
on (a11.ritm_stage_src_key=a122.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_request_item_state       a123
on (a11.ritm_state_src_key=a123.row_key)
union
select'ldb.d_internal_contact_assign_to_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_internal_contact_assign_to_rt_c       a124
on (a11.assigned_to_key=a124.row_key)
union
select'ldb.d_internal_contact_closed_by_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_internal_contact_closed_by_rt_c       a125
on (a11.closed_by_key=a125.row_key)
union
select'ldb.d_internal_contact_mdm_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
 left outer join ldb.d_internal_contact_rt_c       a16
on (a11.opened_by_key=a16.row_key)
left outer join ldb.d_internal_contact_mdm_rt_c       a126
on (a16.row_current_key=a126.row_current_key)
union
select'ldb.d_location_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_location_rt_c       a127
on (a11.location_key=a127.row_key)
union
select'ldb.d_sc_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_sc_task_priority       a128
on (a11.priority_src_key=a128.row_key)
union
select'ldb.d_sc_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_sc_task_state       a129
on (a11.state_src_key=a129.row_key)
union
select'ldb.d_internal_contact_requested_for_ri_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_internal_contact_requested_for_ri_c       a130
on (a11.ritm_requested_for_ri_c_key=a130.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_internal_contact_task_closed_by       a131
on (a11.ritm_closed_by_key=a131.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
left outer join ldb.d_location       a132
on (a11.ritm_location_key=a132.row_key)
union
select'ldb.d_internal_contact_application_owner_ri_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
 left outer join ldb.d_master_item       a14
on (a11.ritm_catalog_item_key=a14.row_key)
left outer join ldb.d_internal_contact_application_owner_ri_c       a133
on (a14.application_owner_c_key=a133.row_key)
union
select'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
 left outer join ldb.d_assignment_group_level0_manager_c_relation       a110
on (a11.assignment_group_key=a110.level0_assigment_group_key)
left outer join ldb.d_assignment_group_level0_manager_c       a134
on (a110.level0_manager_c_key=a134.level0_manager_c_key)
union
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
  left outer join ldb.d_calendar_greg_fiscal_c       a114
on (a11.ritm_opened_on_key=a114.greogrian_calendar_key)
left outer join ldb.d_calendar_date_fiscal       a115
on (a114.fiscal_key=a115.row_key)
left outer join ldb.d_calendar_fiscal_period       a135
on (a115.period_start_date_key=a135.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
 left outer join ldb.d_calendar_date       a112
on (a11.ritm_opened_on_key=a112.row_key)
left outer join ldb.d_calendar_month       a136
on (a112.month_start_date_key=a136.row_key)
union
select'ldb.d_calendar_fiscal_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
 left outer join ldb.d_calendar_greg_fiscal_c       a114
on (a11.ritm_opened_on_key=a114.greogrian_calendar_key)
left outer join ldb.d_calendar_date_fiscal       a115
on (a114.fiscal_key=a115.row_key)
left outer join ldb.d_calendar_fiscal_quarter       a137
on (a115.quarter_start_date_key=a137.row_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c       a11 
 left outer join ldb.d_calendar_greg_fiscal_c       a114
on (a11.ritm_opened_on_key=a114.greogrian_calendar_key)
left outer join ldb.d_calendar_date_fiscal       a115
on (a114.fiscal_key=a115.row_key)
left outer join ldb.d_calendar_fiscal_year       a138
on (a115.year_start_date_key=a138.row_key)






