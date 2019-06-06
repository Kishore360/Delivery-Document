select 'ldb.f_task_c_closed_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_master_item       a12
on (a11.catalog_item_key = a12.row_key)
union
select'ldb.d_task_ra_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_task_ra_c       a13
on (a11.task_key = a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_calendar_date       a15
on (a11.closed_on_key = a15.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
 join ldb.d_calendar_date       a15
on (a11.closed_on_key = a15.row_key)
join ldb.d_calendar_month       a16
on (a15.month_start_date_key = a16.row_key)
union
select'ldb.d_task_parent_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11
 join ldb.d_task_ra_c       a13
on (a11.task_key = a13.row_key)
join ldb.d_task_parent_c       a17
on (a13.parent_task_key = a17.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_internal_contact_assigned_to       a18
on (a11.assigned_to_key = a18.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_internal_contact       a19
on (a11.task_caller_c_key = a19.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_internal_contact_task_closed_by       a110
on (a11.closed_by_key = a110.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_internal_organization_legalentity       a111
on (a11.company_key = a111.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_configuration_item       a112
on (a11.configuration_item_key = a112.row_key)
union
select'ldb.d_lov_task_contacttype_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_lov_task_contacttype_c       a113
on (a11.contact_type_src_c_key = a113.row_key)
union
select'ldb.d_lov_task_c_escalation_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_lov_task_c_escalation_c       a114
on (a11.escalation_c_key = a114.row_key)
union
select'ldb.d_lov_task_priority_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_lov_task_priority_c       a115
on (a11.priority_key = a115.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_location       a116
on (a11.location_key = a116.row_key)
union
select'ldb.d_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_internal_contact_opened_by_c       a117
on (a11.opened_by_key = a117.row_key)
union
select'ldb.d_lov_task_c_approval_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_lov_task_c_approval_c       a118
on (a11.approval_state_src_key = a118.row_key)
union
select'ldb.d_lov_task_impact_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_lov_task_impact_c       a119
on (a11.impact_src_key = a119.row_key)
union
select'ldb.d_lov_task_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_lov_task_state_c       a120
on (a11.state_src_key = a120.row_key)
union
select'ldb.d_lov_task_urgency_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
join ldb.d_lov_task_urgency_c       a121
on (a11.urgency_src_key = a121.row_key)
union
select'ldb.d_internal_contact_org_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11
 join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
join ldb.d_internal_contact_org_manager_c       a122
on (a14.org_manager_c_key = a122.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
 join ldb.d_calendar_date       a15
on (a11.closed_on_key = a15.row_key)
join ldb.d_calendar_quarter       a123
on (a15.quarter_start_date_key = a123.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c_closed_c       a11 
 join ldb.d_calendar_date       a15
on (a11.closed_on_key = a15.row_key)
join ldb.d_calendar_year       a124
on (a15.year_start_date_key = a124.row_key)


