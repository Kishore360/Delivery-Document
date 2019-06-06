SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.sys_audit_final  SRC 
JOIN mercury_mdwdb.f_catalog_audit_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  and SRC.tablename in ('sc_cat_item','item_option_new')
WHERE SRC.newvalue<>(TRGT.task_attribute_wh_new_value) 
