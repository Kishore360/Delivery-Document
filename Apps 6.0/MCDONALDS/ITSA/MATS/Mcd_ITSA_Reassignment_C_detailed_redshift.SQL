/* Tables Accessed:
D_INCIDENT
D_INCIDENT_ACTIVITY_CALENDAR_MONTH
D_INCIDENT_ACTIVITY_DATE
D_INCIDENT_ASSIGNMENT_GROUP
D_INCIDENT_ASSIGNMENT_GROUP_MANAGER
D_INCIDENT_BUSINESS_SERVICE
D_INCIDENT_PRIORITY
D_INCIDENT_STATE
D_INTERNAL_CONTACT_FROM
D_INTERNAL_CONTACT_SERVICE_OWNED_BY_C
D_INTERNAL_CONTACT_TO
D_INTERNAL_ORGANIZATION_GROUP_FROM
D_INTERNAL_ORGANIZATION_GROUP_TO
D_INTERNAL_ORGANIZATION_NEW_VENDOR_C
D_INTERNAL_ORGANIZATION_OLD_VENDOR_C
D_INTERNAL_ORGANIZATION_VENDOR_C
D_SCAFE_CORE_REALM_C
D_SERVICE_INCIDENT_NEVA_SUBCATEGORY_C
F_INCIDENT_ACTIVITY */

select 'ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11 
 union
select 'ldb."D_LOV_INCIDENT_SNAPSHOT_AGE_C" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11 
 join "ldb"."D_LOV_INCIDENT_SNAPSHOT_AGE_C" a12 
 on (a11.INCIDENT_SNAPSHOT_AGE_C_KEY = a12.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_ASSIGNMENT_GROUP_SNAPSHOT" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11 
 join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP_SNAPSHOT" a13 
 on (a11.ASSIGNMENT_GROUP_KEY = a13.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_SNAPSHOT_MONTH_START_C" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11 
 join "ldb"."D_INCIDENT_SNAPSHOT_MONTH_START_C" a14 
 on (a11.INCIDENT_SNAPSHOT_MONTH_START_C_KEY = a14.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE_SNAPSHOT" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11 
 join "ldb"."D_INCIDENT_BUSINESS_SERVICE_SNAPSHOT" a15 
 on (a11.BUSINESS_SERVICE_KEY = a15.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_SNAPSHOT_GROUPED_VENDOR_C" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11 
 join "ldb"."D_INCIDENT_SNAPSHOT_GROUPED_VENDOR_C" a16 
 on (a11.INCIDENT_SNAPSHOT_GROUPED_VENDOR_C_KEY = a16.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_SNAPSHOT_PRIORITY_C" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11 
 join "ldb"."D_INCIDENT_SNAPSHOT_PRIORITY_C" a17 
 on (a11.PRIORITY_SRC_KEY = a17.ROW_KEY)  

