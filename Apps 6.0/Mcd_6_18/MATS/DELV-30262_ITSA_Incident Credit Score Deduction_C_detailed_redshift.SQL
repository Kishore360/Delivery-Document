/* 
Tables Accessed:
D_BUSINESS_SERVICE
D_INTERNAL_ORGANIZATION_CCS_VENDOR_C
d_assignment_group_manager
d_incident
d_incident_priority
d_internal_organization_department
d_internal_organization_group
f_incident_credit_score_detail */

SELECT 'f_incident_credit_score_detail' AS Table_Name,Count(1) as Row_COunt 
FROM "ldb"."f_incident_credit_score_detail" 
UNION 
SELECT 'd_incident' AS Table_Name,Count(1) as Row_COunt 
FROM "ldb"."f_incident_credit_score_detail"  a
JOIN ldb.d_incident b ON a.incident_key=b.row_key 
UNION 
SELECT 'd_incident_priority' AS Table_Name,Count(1) as Row_COunt 
FROM "ldb"."f_incident_credit_score_detail"  a
JOIN ldb.d_incident b ON a.incident_key=b.row_key
JOIN ldb.d_incident_priority c ON b.priority_src_key=c.row_key 
UNION 
SELECT 'd_internal_organization_group' AS Table_Name,Count(1) as Row_COunt 
FROM "ldb"."f_incident_credit_score_detail"  a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_internal_organization_group' AS Table_Name,Count(1) as Row_COunt 
FROM "ldb"."f_incident_credit_score_detail"  a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.d_internal_organization_department c ON a.department_key=c.row_key 
UNION 
SELECT 'd_internal_organization_group' AS Table_Name,Count(1) as Row_COunt 
FROM "ldb"."f_incident_credit_score_detail"  a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.d_assignment_group_manager c ON b.assignment_group_manager_key=c.row_key 
UNION 
SELECT 'D_INTERNAL_ORGANIZATION_CCS_VENDOR_C' AS Table_Name,Count(1) as Row_COunt 
FROM "ldb"."f_incident_credit_score_detail"  a
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.D_INTERNAL_ORGANIZATION_CCS_VENDOR_C c ON b.CCS_VENDOR_C_KEY=c.row_key
UNION 
SELECT 'D_BUSINESS_SERVICE' AS Table_Name,Count(1) as Row_COunt 
FROM "ldb"."f_incident_credit_score_detail"  a
JOIN ldb.D_BUSINESS_SERVICE b ON a.business_service_key=b.row_key 
