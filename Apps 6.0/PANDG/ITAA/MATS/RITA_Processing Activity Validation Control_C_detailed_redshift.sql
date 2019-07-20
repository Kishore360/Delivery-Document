/* 

Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_year
d_lov_processing_activities_data_subject_type_c
d_lov_processing_activities_ot_age_class_c
d_lov_processing_activities_ot_life_cycle_status_c
d_png_ot_compliance_control_c
d_png_ot_processing_activities_inventory_c
d_png_ot_processing_activity_validation_control_c
d_processing_activities_managing_organization_c
d_processing_activities_owning_organization_c
f_png_ot_processing_activity_validation_control_c
 */

select 'ldb.f_png_ot_processing_activity_validation_control_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_png_ot_processing_activity_validation_control_c       a11 
union
select 'ldb.d_png_ot_processing_activities_inventory_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_png_ot_processing_activity_validation_control_c a11 
join ldb.d_png_ot_processing_activities_inventory_c  a12 on (a11.png_ot_inventory_c_key = a12.row_key)

UNION 
select 'ldb.d_processing_activities_managing_organization_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_png_ot_processing_activity_validation_control_c  a11 
join ldb.d_processing_activities_managing_organization_c  a12 on (a11.managing_organization_c_key = a12.row_key)
union
select'ldb.d_png_ot_processing_activity_validation_control_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_png_ot_processing_activity_validation_control_c       a11 
join ldb.d_png_ot_processing_activity_validation_control_c       a13
on (a11.processing_activity_validation_control_c_key = a13.row_key)
union
select'ldb.d_png_ot_compliance_control_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_png_ot_processing_activity_validation_control_c       a11 
join ldb.d_png_ot_compliance_control_c       a14
on (a11.png_ot_validation_control_c_key = a14.row_key)
union
select'ldb.d_processing_activities_owning_organization_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_png_ot_processing_activity_validation_control_c       a11 
join ldb.d_processing_activities_owning_organization_c       a15
on (a11.owning_organization_c_key = a15.row_key)
union
select'ldb.d_lov_processing_activities_ot_age_class_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_png_ot_processing_activity_validation_control_c       a11
 join ldb.d_png_ot_processing_activities_inventory_c       a12
on (a11.png_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_age_class_c       a16
on (a12.ot_age_class_c_key = a16.row_key)
union
select'ldb.d_lov_processing_activities_ot_life_cycle_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_png_ot_processing_activity_validation_control_c       a11
 join ldb.d_png_ot_processing_activities_inventory_c       a12
on (a11.png_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_ot_life_cycle_status_c       a17
on (a12.ot_life_cycle_status_c_key = a17.row_key)
union
select'ldb.d_lov_processing_activities_data_subject_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_png_ot_processing_activity_validation_control_c       a11
 join ldb.d_png_ot_processing_activities_inventory_c       a12
on (a11.png_ot_inventory_c_key = a12.row_key)
join ldb.d_lov_processing_activities_data_subject_type_c       a18
on (a12.data_subject_type_c_key = a18.row_key)

UNION 
select 'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_png_ot_processing_activity_validation_control_c a11 
join ldb.d_calendar_date  a12 on (a11.date_key = a12.row_key)
UNION 

select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_png_ot_processing_activity_validation_control_c a11 
join ldb.d_calendar_date  a12 on (a11.date_key = a12.row_key)
JOIN ldb.d_calendar_month a13 ON a12.month_start_date_key=a13.row_key
UNION 

select 'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_png_ot_processing_activity_validation_control_c a11 
join ldb.d_calendar_date  a12 on (a11.date_key = a12.row_key)
JOIN ldb.d_calendar_month a13 ON a12.month_start_date_key=a13.row_key
JOIN ldb.d_calendar_quarter a14 ON a13.quarter_start_date_key=a14.row_key

UNION 
select 'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_png_ot_processing_activity_validation_control_c a11 
join ldb.d_calendar_date  a12 on (a11.date_key = a12.row_key)
JOIN ldb.d_calendar_month a13 ON a12.month_start_date_key=a13.row_key
JOIN ldb.d_calendar_quarter a14 ON a13.quarter_start_date_key=a14.row_key
JOIN ldb.d_calendar_year a15 ON a14.year_start_date_key=a15.row_key
