SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_task.row_key' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.interaction_related_record_final SRC 
JOIN jhi_mdwdb.d_task TRGT ON SRC.task = TRGT.row_key and SRC.sourceinstance = TRGT.source_id
WHERE SRC.task <> (TRGT.row_key) and TRGT.soft_deleted_flag ='N';