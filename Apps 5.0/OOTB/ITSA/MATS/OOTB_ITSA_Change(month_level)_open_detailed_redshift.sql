select 'ldb.f_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
union
select'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key = a14.lev_0_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request       a15
on (a11.change_request_key = a15.row_key)
union
select'ldb.d_change_request_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_priority       a16
on (a11.priority_src_key = a16.row_key)
union
select'ldb.d_change_request_risk' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_risk       a17
on (a11.risk_src_key = a17.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_configuration_item       a18
on (a11.configuration_item_key = a18.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_contact_assigned_to       a19
on (a11.assigned_to_key = a19.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month       a110
on (a12.month_start_date_key = a110.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_week       a111
on (a12.week_start_date_key = a111.row_key)
union
select'ldb.d_change_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_category       a112
on (a11.category_src_key = a112.row_key)
union
select'ldb.d_change_request_scope' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_scope       a113
on (a11.scope_src_key = a113.row_key)
union
select'ldb.d_change_request_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_state       a114
on (a11.state_src_key = a114.row_key)
union
select'ldb.d_change_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_type       a115
on (a11.type_src_key = a115.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_organization_department       a116
on (a11.requested_by_department_key = a116.row_key)
union
select'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
  join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key = a14.lev_0_key)
join ldb.dh_user_group_level1       a117
on (a14.lev_1_key = a117.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_quarter       a118
on (a12.quarter_start_date_key = a118.row_key)
union
select'ldb.dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
  join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key = a14.lev_0_key)
join ldb.dh_user_group_level2       a119
on (a14.lev_2_key = a119.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11
 join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_year       a120
on (a12.year_start_date_key = a120.row_key)



