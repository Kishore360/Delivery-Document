

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary_aux' ELSE 'SUCCESS' END as Message
FROM app_test.fs_agent_call_summary_aux SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_call_summary_aux TRGT 
	ON (SRC.row_id =TRGT.row_id and SRC.source_id =  TRGT.source_id)
WHERE COALESCE(concat(SRC.parent_row_id,SRC.row_id,SRC.AUX_TIME,SRC.CREATED_BY,SRC.CHANGED_BY,SRC.CREATED_ON,SRC.CHANGED_ON),'')
<> 
      COALESCE(concat(TRGT.parent_row_id,TRGT.row_id,
 TRGT.AUX_TIME, TRGT.CREATED_BY, TRGT.CHANGED_BY, TRGT.CREATED_ON, TRGT.CHANGED_ON),'')
