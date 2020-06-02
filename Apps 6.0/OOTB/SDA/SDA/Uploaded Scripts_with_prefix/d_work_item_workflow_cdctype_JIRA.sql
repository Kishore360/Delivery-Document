SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item_workflow.cdctype' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.workflow_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item_workflow TRGT 
	ON (SRC.name =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id)
WHERE COALESCE(SRC.cdctype,'')<> COALESCE(TRGT.cdctype,'');