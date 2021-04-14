/* Tables Accessed:
d_caused_by_change_ccs_major_c
d_incident
d_incident_priority
d_major_inc_assigned_to_c
d_major_inc_assignment_group_c
d_major_inc_configuration_item_c
f_major_incident_detailed_c */

select 'ldb."f_major_incident_detailed_c" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_major_incident_detailed_c" a11 
 union
select 'ldb."d_incident" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_major_incident_detailed_c" a11 
 join "ldb"."d_incident" a12 
 on (a11.incident_key = a12.row_key)  
 union
select 'ldb."d_major_inc_assignment_group_c" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_major_incident_detailed_c" a11 
 join "ldb"."d_incident" a12 
 on (a11.incident_key = a12.row_key) 
 join "ldb"."d_major_inc_assignment_group_c" a13 
 on (a12.major_inc_assignment_group_c_key = a13.row_key)  
 union
select 'ldb."d_caused_by_change_ccs_major_c" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_major_incident_detailed_c" a11 
 join "ldb"."d_incident" a12 
 on (a11.incident_key = a12.row_key) 
 join "ldb"."d_caused_by_change_ccs_major_c" a14 
 on (a12.caused_by_change_ccs_major_c_key = a14.row_key)  
 union
select 'ldb."d_incident_priority" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_major_incident_detailed_c" a11 
 join "ldb"."d_incident" a12 
 on (a11.incident_key = a12.row_key) 
 join "ldb"."d_incident_priority" a15 
 on (a12.priority_src_key = a15.row_key)  
 union
select 'ldb."d_major_inc_assigned_to_c" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_major_incident_detailed_c" a11 
 join "ldb"."d_incident" a12 
 on (a11.incident_key = a12.row_key) 
 join "ldb"."d_major_inc_assigned_to_c" a16 
 on (a12.major_inc_assigned_to_c_key = a16.row_key)  
 union
select 'ldb."d_major_inc_configuration_item_c" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_major_incident_detailed_c" a11 
 join "ldb"."d_incident" a12 
 on (a11.incident_key = a12.row_key) 
 join "ldb"."d_major_inc_configuration_item_c" a17 
 on (a12.major_inc_configuration_item_c_key = a17.row_key) 

