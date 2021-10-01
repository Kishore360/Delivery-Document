Tables Accessed:
D_INCIDENT_ASSIGNED_TO
D_INCIDENT_ASSIGNMENT_GROUP_MANAGER
D_INCIDENT_BUSINESS_SERVICE
D_INCIDENT_CONFIGURATION_ITEM_MDM
D_PARENT_INCIDENT
d_configuration_item_incident
d_incident
d_incident_activity_calendar_month
d_incident_activity_date
d_incident_assignment_group
d_incident_close_code
d_incident_priority
d_incident_state
d_incident_state_from
d_incident_state_to
f_incident_state

select 'ldb."f_incident_state" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 union
select 'ldb."d_incident_activity_date" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident_activity_date" a12 
	on (a11.incident_activity_date_key = a12.row_key)  
 union
select 'ldb."d_incident" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident" a13 
	on (a11.incident_key = a13.row_key)  
 union
select 'ldb."d_incident_activity_calendar_month" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident_activity_date" a12 
 on (a11.incident_activity_date_key = a12.row_key) 
	join "ldb"."d_incident_activity_calendar_month" a14 
	on (a12.month_start_date_key = a14.row_key)  
 union
select 'ldb."d_incident_state_from" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident_state_from" a15 
	on (a11.from_state_src_key = a15.row_key)  
UNION 
select 'ldb."d_incident_state_to" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident_state_to" a15 
	on (a11.to_state_src_key = a15.row_key)
 union
select 'ldb."d_incident_assignment_group" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident" a13 
 on (a11.incident_key = a13.row_key) 
	join "ldb"."d_incident_assignment_group" a16 
	on (a13.assignment_group_key = a16.row_key)  
 union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident" a13 
 on (a11.incident_key = a13.row_key) 
	join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a17 
	on (a13.business_service_key = a17.row_key)  
 union
select 'ldb."d_incident_close_code" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident" a13 
 on (a11.incident_key = a13.row_key) 
	join "ldb"."d_incident_close_code" a18 
	on (a13.close_code_src_key = a18.row_key)  
 union
select 'ldb."D_PARENT_INCIDENT" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident" a13 
 on (a11.incident_key = a13.row_key) 
	join "ldb"."D_PARENT_INCIDENT" a19 
	on (a13.parent_incident_key = a19.row_key) 
UNION 
select 'ldb."d_incident_state" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident" a13 
	on (a11.incident_key = a13.row_key) 
JOIN ldb.d_incident_state b ON a13.state_src_key=b.row_key 

UNION 
select 'ldb."d_incident_priority" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident" a13 
	on (a11.incident_key = a13.row_key) 
JOIN ldb.d_incident_priority b ON a13.priority_src_key=b.row_key 
UNION 
select 'ldb."d_configuration_item_incident" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident" a13 
	on (a11.incident_key = a13.row_key) 
JOIN ldb.d_configuration_item_incident b ON a13.configuration_item_key=b.row_key 
UNION 
UNION 
select 'ldb."D_INCIDENT_CONFIGURATION_ITEM_MDM" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident" a13 
	on (a11.incident_key = a13.row_key) 
JOIN ldb.d_configuration_item_incident b ON a13.configuration_item_key=b.row_key
JOIN ldb.D_INCIDENT_CONFIGURATION_ITEM_MDM c ON b.MDM_KEY=c.row_key 
UNION 
select 'ldb."D_INCIDENT_ASSIGNMENT_GROUP_MANAGER" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident" a13 
 on (a11.incident_key = a13.row_key) 
	join "ldb"."d_incident_assignment_group" a16 
	on (a13.assignment_group_key = a16.row_key) 
JOIN ldb.D_INCIDENT_ASSIGNMENT_GROUP_MANAGER b  ON a16. manager_key=b.row_key 
UNION 
select 'ldb."D_INCIDENT_ASSIGNED_TO" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_state" a11 
 join "ldb"."d_incident" a13 
 on (a11.incident_key = a13.row_key)
JOIN ldb.D_INCIDENT_ASSIGNED_TO b ON a13.assigned_to_key=b.row_key 




