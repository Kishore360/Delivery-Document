SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.pg_delegate_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM ntrs_mdsdb.cmdb_ci_model_final SRC
left JOIN ntrs_mdsdb.u_cmdb_ci_software_master_final SRC1 on SRC.u_software=SRC1.sys_id
JOIN ntrs_mdwdb.d_cmdb_ci_model_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN ntrs_mdwdb.d_cmdb_ci_software_master_c LKP1 ON SRC1.sys_id=LKP1.row_id AND SRC1.sourceinstance=LKP1.source_id
WHERE COALESCE(LKP1.row_key,CASE WHEN SRC.u_software is NULL THEN 0 ELSE -1 END)<>TRGT.cmdb_ci_software_master_c_key) temp;
