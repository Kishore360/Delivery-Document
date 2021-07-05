SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.row_key' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.interaction_final  SRC 
JOIN jhi_mdwdb.d_internal_contact TRGT ON 
SRC.assigned_to = TRGT.row_key and SRC.sourceinstance = TRGT.source_id
WHERE  SRC.assigned_to <> (TRGT.row_key) and TRGT.soft_deleted_flag ='N';