select 'ldb.f_change_request_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
union
select'ldb.d_three_month_rolling' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_three_month_rolling       a13
on (a12.month_start_date_key = a13.this_month_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
union
select'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy       a15
on (a14.row_dn_key = a15.lev_0_key)
union
select'ldb.d_three_week_rolling' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_three_week_rolling       a16
on (a12.week_start_date_key = a16.this_week_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_month       a17
on (a12.month_start_date_key = a17.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11
 join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_week       a18
on (a12.week_start_date_key = a18.row_key)
union
select'ldb.d_change_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_category       a19
on (a11.category_src_key = a19.row_key)
union
select'ldb.d_change_request_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_priority       a110
on (a11.priority_src_key = a110.row_key)
union
select'ldb.d_change_request_risk' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_risk       a111
on (a11.risk_src_key = a111.row_key)
union
select'ldb.d_change_request_scope' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_scope       a112
on (a11.scope_src_key = a112.row_key)
union
select'ldb.d_change_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_type       a113
on (a11.type_src_key = a113.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_configuration_item       a114
on (a11.configuration_item_key = a114.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_department       a115
on (a11.requested_by_department_key = a115.row_key)
union
select'ldb.d_calendar_month_three_rolling' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
  join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_three_month_rolling       a13
on (a12.month_start_date_key = a13.this_month_key)
join ldb.d_calendar_month_three_rolling       a116
on (a13.rolling_three_month_key = a116.row_key)
union
select'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
  join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy       a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.dh_user_group_level1       a117
on (a15.lev_1_key = a117.row_key)
union
select'ldb.d_calendar_week_three_rolling' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11
  join ldb.d_calendar_date       a12
on (a11.closed_on_key = a12.row_key)
join ldb.d_three_week_rolling       a16
on (a12.week_start_date_key = a16.this_week_key)
join ldb.d_calendar_week_three_rolling       a118
on (a16.rolling_three_week_key = a118.row_key)
union
select'ldb.dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
  join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy       a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.dh_user_group_level2       a119
on (a15.lev_2_key = a119.row_key)
union
select'ldb.dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11
  join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy       a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.dh_user_group_level3       a120
on (a15.lev_3_key = a120.row_key)
union
select'ldb.dh_user_group_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
  join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy       a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.dh_user_group_level4       a121
on (a15.lev_4_key = a121.row_key)






