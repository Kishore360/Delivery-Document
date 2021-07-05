SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_interaction_c.updated_on_c' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.interaction_final  SRC 
JOIN jhi_mdwdb.d_interaction_c TRGT ON 
SRC.sys_id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
WHERE SRC.sys_updated_on <> (TRGT.updated_on_c) and TRGT.soft_deleted_flag ='N';