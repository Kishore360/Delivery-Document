/* Tables Accessed:
d_change_request
d_emergency_change_assignment_group_c
d_incident
d_incident_priority
f_emergency_change_rate_detailed_c */

select 'ldb."f_emergency_change_rate_detailed_c" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_emergency_change_rate_detailed_c" a11 
 union
select 'ldb."d_change_request" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_emergency_change_rate_detailed_c" a11 
 join "ldb"."d_change_request" a12 
	on (a11.change_request_key = a12.row_key)  
 union
select 'ldb."d_emergency_change_assignment_group_c" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_emergency_change_rate_detailed_c" a11 
 join "ldb"."d_change_request" a12 
 on (a11.change_request_key = a12.row_key) 
	join "ldb"."d_emergency_change_assignment_group_c" a13 
	on (a12.change_emergency_assignment_group_c_key = a13.row_key)  
 union
select 'ldb."d_incident" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_emergency_change_rate_detailed_c" a11 
 join "ldb"."d_incident" a14 
	on (a11.incident_key = a14.row_key)  
 union
select 'ldb."d_incident_priority" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_emergency_change_rate_detailed_c" a11 
 join "ldb"."d_incident" a14 
 on (a11.incident_key = a14.row_key) 
	join "ldb"."d_incident_priority" a15 
	on (a14.priority_src_key = a15.row_key) 

