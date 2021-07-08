SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_cmdb_ci_rel_c.connection_strength_c_key' ELSE 'SUCCESS' END as Message
FROM (Select Count(1) as CNT
FROM jhi_mdsdb.cmdb_rel_ci_final SRC
JOIN jhi_mdwdb.d_cmdb_ci_rel_c TRGT ON (SRC.sys_id = TRGT.row_key and SRC.sourceinstance = TRGT.source_id)
JOIN jhi_mdwdb.d_lov LKP ON COALESCE(upper(SRC.connection_strength),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.connection_strength IS NULL THEN 0 ELSE -1 END) <> TRGT.connection_strength_c_key AND TRGT.soft_deleted_flag='N') temp;