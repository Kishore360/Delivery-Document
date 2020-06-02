

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for t_task_activity.row_id' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC 
 -- right join done assuming rowcount is validated
 RIGHT JOIN #DWH_TABLE_SCHEMA.f_t_task_activity TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE coalesce(TRGT.primary_sequence_id,'') <>0
 AND COALESCE(SRC.sys_id,'')<> COALESCE(TRGT.row_id ,'')
