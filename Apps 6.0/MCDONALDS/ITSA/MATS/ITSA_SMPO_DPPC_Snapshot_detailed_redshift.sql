select 'ldb."F_N_A_INCIDENT_BACKLOG_SMPO_DPPC" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_A_INCIDENT_BACKLOG_SMPO_DPPC" a11 
 union
select 'ldb."D_CALENDAR_MONTH" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_A_INCIDENT_BACKLOG_SMPO_DPPC" a11 
 join "ldb"."D_CALENDAR_MONTH" a12 
	on (a11.month_key = a12.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_CONTACT_ASSIGNED_TO" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_A_INCIDENT_BACKLOG_SMPO_DPPC" a11 
 join "ldb"."D_INTERNAL_CONTACT_ASSIGNED_TO" a13 
	on (a11.ASSIGNED_TO_KEY = a13.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_ORGANIZATION_GROUP" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_A_INCIDENT_BACKLOG_SMPO_DPPC" a11 
 join "ldb"."D_INTERNAL_ORGANIZATION_GROUP" a14 
	on (a11.ASSIGNMENT_GROUP_KEY = a14.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_CONTACT_ASSIGNMENT_GROUP_MANAGER_SNAPSHOT" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_A_INCIDENT_BACKLOG_SMPO_DPPC" a11 
 join "ldb"."D_INTERNAL_CONTACT_ASSIGNMENT_GROUP_MANAGER_SNAPSHOT" a15 
	on (a11.ASSIGNMENT_GROUP_MANAGER_KEY = a15.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_CONTACT_EXECUTIVE_LEADER_SNAPSHOT" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_A_INCIDENT_BACKLOG_SMPO_DPPC" a11 
 join "ldb"."D_INTERNAL_CONTACT_EXECUTIVE_LEADER_SNAPSHOT" a16 
	on (a11.EXECUTIVE_LEADER_KEY = a16.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_CONTACT_ASSIGNMENT_GROUP_LEADER_SNAPSHOT" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_A_INCIDENT_BACKLOG_SMPO_DPPC" a11 
 join "ldb"."D_INTERNAL_CONTACT_ASSIGNMENT_GROUP_LEADER_SNAPSHOT" a17 
	on (a11.LEADER_KEY = a17.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_CONTACT_REQUEST_ITEM_CLOSED_BY_SMPO" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_A_INCIDENT_BACKLOG_SMPO_DPPC" a11 
 join "ldb"."D_INTERNAL_CONTACT_REQUEST_ITEM_CLOSED_BY_SMPO" a18 
	on (a11.request_item_closed_by_key = a18.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_CONTACT_SENIOR_LEADER_SNAPSHOT" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_A_INCIDENT_BACKLOG_SMPO_DPPC" a11 
 join "ldb"."D_INTERNAL_CONTACT_SENIOR_LEADER_SNAPSHOT" a19 
	on (a11.SENIOR_LEADER_KEY = a19.ROW_KEY)  
 union
select 'ldb."D_SUPPLIER_ASSIGNED_TO_VENDOR_SNAPSHOT" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_A_INCIDENT_BACKLOG_SMPO_DPPC" a11 
 join "ldb"."D_SUPPLIER_ASSIGNED_TO_VENDOR_SNAPSHOT" a110 
	on (a11.VENDOR_KEY = a110.ROW_KEY)  

