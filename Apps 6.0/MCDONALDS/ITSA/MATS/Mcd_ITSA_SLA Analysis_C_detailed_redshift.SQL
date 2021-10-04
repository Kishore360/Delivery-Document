/* Tables Accessed:
D_INTERNAL_CONTACT_SLA_SERVICE_OWNED_BY_C
D_LOV_SLA_INCIDENT_PRIORITY_C
D_LOV_SLA_INCIDENT_STATE_C
D_NEW_SLA_BUSINESS_SERVICE_C
D_SLA_ANALYSIS_C
D_SLA_INCIDENT_C
D_SLA_SCAFE_CORE_REALM_C
F_SLA_ANALYSIS_FACT_C
 */
 
 select 'ldb."F_SLA_ANALYSIS_FACT_C" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_SLA_ANALYSIS_FACT_C" a11 
 union
select 'ldb."D_SLA_ANALYSIS_C" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_SLA_ANALYSIS_FACT_C" a11 
 join "ldb"."D_SLA_ANALYSIS_C" a12 
 on (a11.SLA_ANALYSIS_C_KEY = a12.ROW_KEY)  
 union
select 'ldb."D_NEW_SLA_BUSINESS_SERVICE_C" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_SLA_ANALYSIS_FACT_C" a11 
 join "ldb"."D_NEW_SLA_BUSINESS_SERVICE_C" a13 
 on (a11.SLA_BUSINESS_SERVICE_C_KEY = a13.ROW_KEY)  
 union
select 'ldb."D_SLA_INCIDENT_C" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_SLA_ANALYSIS_FACT_C" a11 
 join "ldb"."D_SLA_ANALYSIS_C" a12 
 on (a11.SLA_ANALYSIS_C_KEY = a12.ROW_KEY) 
join "ldb"."D_SLA_INCIDENT_C" a14 
 on (a12.SLA_INCIDENT_C_KEY = a14.ROW_KEY)  
 union
select 'ldb."D_SLA_SCAFE_CORE_REALM_C" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_SLA_ANALYSIS_FACT_C" a11 
 join "ldb"."D_SLA_SCAFE_CORE_REALM_C" a15 
 on (a11.SLA_SCAFE_CORE_REALM_C_KEY = a15.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_CONTACT_SLA_SERVICE_OWNED_BY_C" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_SLA_ANALYSIS_FACT_C" a11 
 join "ldb"."D_NEW_SLA_BUSINESS_SERVICE_C" a13 
 on (a11.SLA_BUSINESS_SERVICE_C_KEY = a13.ROW_KEY) 
join "ldb"."D_INTERNAL_CONTACT_SLA_SERVICE_OWNED_BY_C" a16 
 on (a13.SLA_SERVICE_OWNED_BY_C_KEY = a16.ROW_KEY)  
 union
select 'ldb."D_LOV_SLA_INCIDENT_PRIORITY_C" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_SLA_ANALYSIS_FACT_C" a11 
 join "ldb"."D_SLA_ANALYSIS_C" a12 
 on (a11.SLA_ANALYSIS_C_KEY = a12.ROW_KEY) join "ldb"."D_SLA_INCIDENT_C" a14 
 on (a12.SLA_INCIDENT_C_KEY = a14.ROW_KEY) 
join "ldb"."D_LOV_SLA_INCIDENT_PRIORITY_C" a17 
 on (a14.SLA_INCIDENT_PRIORITY_SRC_C_KEY = a17.ROW_KEY)  
 union
select 'ldb."D_LOV_SLA_INCIDENT_STATE_C" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_SLA_ANALYSIS_FACT_C" a11 
 join "ldb"."D_SLA_ANALYSIS_C" a12 
 on (a11.SLA_ANALYSIS_C_KEY = a12.ROW_KEY) join "ldb"."D_SLA_INCIDENT_C" a14 
 on (a12.SLA_INCIDENT_C_KEY = a14.ROW_KEY) 
join "ldb"."D_LOV_SLA_INCIDENT_STATE_C" a18 
 on (a14.SLA_INCIDENT_STATE_SRC_C_KEY = a18.ROW_KEY)  

