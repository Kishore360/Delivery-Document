SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.sys_audit_final  SRC 
JOIN meritsa_mdwdb.f_catalog_audit_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  and SRC.tablename in ('sc_cat_item','item_option_new')
WHERE SRC.tablename<>(TRGT.task_wh_type) 
