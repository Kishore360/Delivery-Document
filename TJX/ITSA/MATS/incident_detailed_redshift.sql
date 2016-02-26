 select  'f_incident' as Table_Name,count(a11.row_key) Row_Count     
   from ldb.f_incident a11
   UNION
 select  'd_configuration_item_causing_ci_c' as Table_Name,count(a11.row_key) Row_Count     
   from ldb.f_incident a11
 join ldb.d_location a12
   on  (a11.location_key = a12.row_key)
   union
    select  'd_business_impact_c' as Table_Name,count(a11.row_key) Row_Count     
   from ldb.f_incident a11
   join ldb.d_incident a12 on a11.incident_key=a12.row_key
 join ldb.d_business_impact_c a13
   on  (a12.business_impact_c_key = a13.row_key)
   union
       select  'd_fujitsu_location_c' as Table_Name,count(a11.row_key) Row_Count     
     from ldb.f_incident a11
   join ldb.d_incident a12 on a11.incident_key=a12.row_key
 join ldb.d_fujitsu_location_c a13
   on  (a12.fujitsu_location_c_key = a13.row_key)
union
          select  'd_gps_reporting_group_c' as Table_Name,count(a11.row_key) Row_Count     
   from ldb.f_incident a11
   join ldb.d_incident a12 on a11.incident_key=a12.row_key
 join ldb.d_gps_reporting_group_c a13
   on  (a12.gps_reporting_group_c_key = a13.row_key)
   union
   
    select  'd_reported_for_c' as Table_Name,count(a11.row_key) Row_Count     
   from ldb.f_incident a11
   join ldb.d_incident a12 on a11.incident_key=a12.row_key
 join ldb.d_reported_for_c a13
   on  (a12.reported_for_c_key = a13.row_key)
   union
   select  'd_reported_for_c' as Table_Name,count(a11.row_key) Row_Count     
   from ldb.f_incident a11
   join ldb.d_incident a12 on a11.incident_key=a12.row_key
 join ldb.d_root_cause_c a13
   on  (a12.root_cause_c_key = a13.row_key)
    union
   select  'Incident_Type_c' as Table_Name,count(a11.row_key) Row_Count     
   from ldb.f_incident a11
   join ldb.d_incident a12 on a11.incident_key=a12.row_key
 join ldb.d_incident_type_c a13
   on  (a12.Incident_Type_c_key = a13.row_key)