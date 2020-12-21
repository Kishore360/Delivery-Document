SELECT 'f_cmdb_ci_instance_c_fact' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_cmdb_ci_instance_c_fact a 
UNION 
SELECT 'd_cmdb_ci_appl_instance_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_cmdb_ci_instance_c_fact a 
JOIN ldb.d_cmdb_ci_appl_instance_c b ON a.cmdb_ci_appl_instance_c_key=b.row_key 
UNION 
SELECT 'd_instance_owner_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_cmdb_ci_instance_c_fact a 
JOIN ldb.d_cmdb_ci_appl_instance_c b ON a.cmdb_ci_appl_instance_c_key=b.row_key 
JOIN ldb.d_instance_owner_c c ON b.instance_owner_c_key=c.row_key 
UNION 
SELECT 'd_release_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_cmdb_ci_instance_c_fact a 
JOIN ldb.d_cmdb_ci_appl_instance_c b ON a.cmdb_ci_appl_instance_c_key=b.row_key 
JOIN ldb.d_release_c c ON b.release_c_key=c.row_key 
UNION 
SELECT 'd_rita_application_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_cmdb_ci_instance_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key 
UNION 
SELECT 'd_rita_application_ext_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_cmdb_ci_instance_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key 
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key 
UNION 
SELECT 'd_instance_pg_asset_owner_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_cmdb_ci_instance_c_fact a 
JOIN ldb.d_instance_pg_asset_owner_c b ON a.instance_pg_asset_owner_c_key=b.row_key
UNION 
SELECT 'd_lov_instance_lifecycle_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_cmdb_ci_instance_c_fact a 
JOIN ldb.d_cmdb_ci_appl_instance_c b ON a.cmdb_ci_appl_instance_c_key=b.row_key 
JOIN ldb.d_lov_instance_lifecycle_c c ON b.instance_lifecycle_c_key=c.row_key 
UNION 
SELECT 'd_instance_pg_asset_owner_c' AS Table_Name,Count(1) as Row_Count
FROM ldb.f_cmdb_ci_instance_c_fact a 
JOIN ldb.d_instance_pg_asset_owner_c b ON a.instance_pg_asset_owner_c_key=b.row_key
JOIN ldb.d_cmdb_ci_instance_location_c c ON b.cmdb_ci_instance_location_c_key=c.row_key 


