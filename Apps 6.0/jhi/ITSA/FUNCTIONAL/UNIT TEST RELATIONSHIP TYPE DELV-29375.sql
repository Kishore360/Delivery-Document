SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_cmdb_ci_rel_c.row_key' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.cmdb_rel_ci_final SRC 
JOIN jhi_mdwdb.d_relationship_type TRGT ON 
SRC.type = TRGT.row_key and SRC.sourceinstance = TRGT.source_id
WHERE  SRC.type <> (TRGT.row_key) and TRGT.soft_deleted_flag ='N';