select 'ldb.f_outage_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c       a11 
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c       a11 
join ldb.d_configuration_item       a15
on (a11.configuration_item_key=a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c       a11 
join ldb.d_calendar_date       a16
on (a11.outage_start_key=a16.row_key)
union
select'ldb.d_config_item_cah_bus_segment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c       a11 
 join ldb.d_configuration_item       a15
on (a11.configuration_item_key=a15.row_key)
join ldb.d_config_item_cah_bus_segment_c       a113
on (a15.cah_bus_segment_src_code_c_key=a113.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c       a11 
 join ldb.d_calendar_date       a16
on (a11.outage_start_key=a16.row_key)
join ldb.d_calendar_month       a115
on (a16.month_start_date_key=a115.row_key)
