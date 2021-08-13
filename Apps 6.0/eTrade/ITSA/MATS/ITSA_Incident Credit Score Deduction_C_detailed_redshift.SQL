/* Tables Accessed:
D_CREDIT_SCORE_CAUSED_BY_CHANGE_C
D_INCIDENT
F_INCIDENT_CREDIT_SCORE_DETAIL
d_incident_priority
d_internal_organization_group */

select 'ldb."F_INCIDENT_CREDIT_SCORE_DETAIL" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CREDIT_SCORE_DETAIL" a11 
 UNION 
 select 'ldb."D_INCIDENT" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CREDIT_SCORE_DETAIL" a11 
 JOIN ldb.D_INCIDENT b ON a11.INCIDENT_KEY=b.row_key 
 UNION 
  select 'ldb."d_incident_priority" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CREDIT_SCORE_DETAIL" a11 
 JOIN ldb.D_INCIDENT b ON a11.INCIDENT_KEY=b.row_key 
 JOIN ldb.d_incident_priority c ON b.PRIORITY_SRC_KEY=c.row_key 
UNION 
 select 'ldb."d_internal_organization_group" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CREDIT_SCORE_DETAIL" a11 
 JOIN ldb.d_internal_organization_group b ON a11.ASSIGNMENT_GROUP_KEY=b.row_key 
UNION 
 select 'ldb."D_CREDIT_SCORE_CAUSED_BY_CHANGE_C" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_CREDIT_SCORE_DETAIL" a11 
 JOIN ldb.D_CREDIT_SCORE_CAUSED_BY_CHANGE_C b ON a11.CREDIT_SCORE_CHANGE_REQUEST_C_KEY=b.row_key 
 