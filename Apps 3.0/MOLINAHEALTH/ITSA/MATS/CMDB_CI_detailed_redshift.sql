select 'ldb.f_configuration_item_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
union
select'ldb.d_configuration_item' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
union
select'ldb.d_calendar_date_created_on_c       ' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
join ldb.d_calendar_date_created_on_c              a13
on (a12.created_on_c_key =a13.row_key)
union
select'ldb.d_calendar_date_validated_c' as Table_Name, count(1) Row_Count
  from  ldb.f_configuration_item_c       a11 
join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
join ldb.d_calendar_date_validated_c       a15
on (a12.last_validated_on_c_key =a15.row_key)
union
select'ldb.d_internal_organization_group         ' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_internal_organization_group                a16
on (a11.assignment_group_key =a16.row_key)
union
select'ldb.d_internal_organization_group_owned_by_team_c              ' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_internal_organization_group_owned_by_team_c                     a17
on (a11.owned_by_team_c_key =a17.row_key)
union
select'ldb.d_domain    ' as Table_Name, count(1) Row_Count
  from  ldb.f_configuration_item_c       a11 
join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
join ldb.d_domain           a18
on (a12.domain_key =a18.row_key)
union
select'ldb.d_configuration_item_install_status_c          ' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
 join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
join ldb.d_configuration_item_install_status_c                 a19
on (a12.install_status_c_key =a19.row_key)
union
select'ldb.d_internal_contact_vp_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
  join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
join ldb.d_configuration_item_operational_status_c                     a110
on (a12.operational_status_src_c_key =a110.row_key)


