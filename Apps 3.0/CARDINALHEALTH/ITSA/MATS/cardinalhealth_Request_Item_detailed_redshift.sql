select'ldb.f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_master_item         a12
on (a11.catalog_item_key=a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_internal_contact         a13
on (a11.opened_by_key=a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_internal_organization_group         a14
on (a11.assignment_group_key=a14.row_key)
union
select'ldb.d_internal_contact_emp_seniors_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
join ldb.d_internal_organization_group         a14
on (a11.assignment_group_key=a14.row_key) 
join ldb.d_internal_contact_emp_seniors_c         a15
on (a14.manager_c_key=a15.row_key)
union
select'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_assignment_group_level0_manager_c_relation         a16
on (a11.assignment_group_key=a16.level0_assigment_group_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_request_item         a17
on (a11.request_item_key=a17.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_calendar_date         a18
on (a11.opened_on_key=a18.row_key)
union
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_calendar_greg_fiscal_c         a19
on (a11.opened_on_key=a19.greogrian_calendar_key)
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
join ldb.d_calendar_greg_fiscal_c         a19
on (a11.opened_on_key=a19.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal        a110
on (a19.fiscal_key=a110.row_key)
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_request        a111
on (a11.request_key=a111.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_internal_contact_assigned_to        a112
on (a11.assigned_to_key=a112.row_key)
union
select'ldb.d_request_item_lov_catalog_item_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_request_item_lov_catalog_item_c        a113
on (a11.catalog_item_c_key=a113.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
join ldb.d_internal_contact         a13
on (a11.opened_by_key=a13.row_key) 
join ldb.d_internal_contact_mdm        a114
on (a13.row_current_key=a114.row_current_key)
union
select'ldb.d_sc_req_item_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_sc_req_item_approval        a115
on (a11.approval_state_src_key=a115.row_key)
union
select'ldb.d_sc_req_item_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_sc_req_item_priority        a116
on (a11.priority_src_key=a116.row_key)
union
select'ldb.d_request_item_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_request_item_stage        a117
on (a11.stage_src_key=a117.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_request_item_state        a118
on (a11.state_src_key=a118.row_key)
union
select'ldb.d_internal_contact_requested_for_ri_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_internal_contact_requested_for_ri_c        a119
on (a11.requested_for_ri_c_key=a119.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_internal_contact_task_closed_by        a120
on (a11.closed_by_key=a120.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_location        a121
on (a11.location_key=a121.row_key)
union
select'ldb.d_internal_contact_application_owner_ri_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
join ldb.d_master_item         a12
on (a11.catalog_item_key=a12.row_key) 
join ldb.d_internal_contact_application_owner_ri_c        a122
on (a12.application_owner_c_key=a122.row_key)
union
select'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
join ldb.d_assignment_group_level0_manager_c_relation         a16
on (a11.assignment_group_key=a16.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c        a123
on (a16.level0_manager_c_key=a123.level0_manager_c_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
join ldb.d_calendar_date         a18
on (a11.opened_on_key=a18.row_key) 
join ldb.d_calendar_month        a124
on (a18.month_start_date_key=a124.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
join ldb.d_calendar_date         a18
on (a11.opened_on_key=a18.row_key) 
join ldb.d_calendar_week        a125
on (a18.week_start_date_key=a125.row_key)
union
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
join ldb.d_calendar_greg_fiscal_c         a19
on (a11.opened_on_key=a19.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal        a110
on (a19.fiscal_key=a110.row_key) 
join ldb.d_calendar_fiscal_period        a126
on (a110.period_start_date_key=a126.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
join ldb.d_calendar_date         a18
on (a11.opened_on_key=a18.row_key) 
join ldb.d_calendar_quarter        a127
on (a18.quarter_start_date_key=a127.row_key)
union
select'ldb.d_calendar_fiscal_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
join ldb.d_calendar_greg_fiscal_c         a19
on (a11.opened_on_key=a19.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal        a110
on (a19.fiscal_key=a110.row_key) 
join ldb.d_calendar_fiscal_quarter        a128
on (a110.quarter_start_date_key=a128.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
join ldb.d_calendar_date         a18
on (a11.opened_on_key=a18.row_key) 
join ldb.d_calendar_year        a129
on (a18.year_start_date_key=a129.row_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
join ldb.d_calendar_greg_fiscal_c         a19
on (a11.opened_on_key=a19.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal        a110
on (a19.fiscal_key=a110.row_key) 
join ldb.d_calendar_fiscal_year        a130
on (a110.year_start_date_key=a130.row_key)
