 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_eit_application_c.division_manager_key' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT
FROM bbandt_mdsdb.cmdb_ci_spkg_final SRC 
JOIN bbandt_mdsdb.u_cmdb_etc_bus_unit_final SRC1 ON (SRC.u_line_of_business=SRC1.u_division_manager and SRC.sourceinstance=SRC1.sourceinstance)
JOIN bbandt_mdwdb.d_eit_application_c TRGT ON (SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
JOIN bbandt_mdwdb.d_internal_contact LKP ON (concat('INTERNAL_CONTACT~',SRC1.u_division_manager)=LKP.role_id AND SRC1.sourceinstance=LKP.source_id)
Where COALESCE(LKP.row_key,CASE WHEn SRC1.u_division_manager IS NULL THEN 0 ELSE -1 END)<>(TRGT.division_manager_key)
)temp;
