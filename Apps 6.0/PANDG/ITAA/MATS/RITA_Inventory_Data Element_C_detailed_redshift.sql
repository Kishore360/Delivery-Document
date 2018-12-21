select 'ldb.f_pandg_ot_data_elements_collected_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_pandg_ot_data_elements_collected_c       a11 
union
select'ldb.d_pandg_ot_data_elements_collected_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_pandg_ot_data_elements_collected_c       a11 
join ldb.d_pandg_ot_data_elements_collected_c       a12
on (a11.pandg_ot_data_elements_collected_c_key = a12.row_key)
union
select'ldb.d_pandg_ot_processing_activities_inventory_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_pandg_ot_data_elements_collected_c       a11
join ldb.d_pandg_ot_processing_activities_inventory_c       a13
on (a11.pandg_ot_inventory_c_key = a13.row_key)