select 'ldb.f_pandg_ot_processing_activity_validation_control_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_pandg_ot_processing_activity_validation_control_c       a11 
union
select'ldb.d_pandg_ot_processing_activities_inventory_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_pandg_ot_processing_activity_validation_control_c       a11 
join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
union
select'ldb.d_pandg_ot_processing_activity_validation_control_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_pandg_ot_processing_activity_validation_control_c       a11 
join ldb.d_pandg_ot_processing_activity_validation_control_c       a13
on (a11.processing_activity_validation_control_c_key = a13.row_key)
union
select'ldb.d_pandg_ot_compliance_control_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_pandg_ot_processing_activity_validation_control_c       a11 
join ldb.d_pandg_ot_compliance_control_c       a14
on (a11.pandg_ot_validation_control_c_key = a14.row_key)
union
select'ldb.d_processing_activities_owning_organization_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_pandg_ot_processing_activity_validation_control_c       a11 
join ldb.d_processing_activities_owning_organization_c       a15
on (a11.owning_organization_c_key = a15.row_key)
union
select'ldb.d_lov_processing_activities_ot_age_class_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_pandg_ot_processing_activity_validation_control_c       a11
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_age_class_c       a16
on (a12.ot_age_class_c_key = a16.row_key)
union
select'ldb.d_lov_processing_activities_ot_life_cycle_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_pandg_ot_processing_activity_validation_control_c       a11
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_life_cycle_status_c       a17
on (a12.ot_life_cycle_status_c_key = a17.row_key)
union
select'ldb.d_lov_processing_activities_data_subject_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_pandg_ot_processing_activity_validation_control_c       a11
 join ldb.d_pandg_ot_processing_activities_inventory_c       a12
on (a11.pandg_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_data_subject_type_c       a18
on (a12.data_subject_type_c_key = a18.row_key)

