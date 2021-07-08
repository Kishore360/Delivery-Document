SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_cmdb_ci_rel_c.most_recent_discovery_c' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.cmdb_rel_ci_final  SRC 
JOIN jhi_mdwdb.d_cmdb_ci_rel_c TRGT ON 
SRC.sys_id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
WHERE SRC.u_last_discovered <> (TRGT.most_recent_discovery_c) and TRGT.soft_deleted_flag ='N';