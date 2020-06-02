SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_credit_score.task_state' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #STG_TABLE_SCHEMA.f_change_credit_score_base) SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_credit_score TRGT 
 ON (SRC.row_id=TRGT.row_id AND SRC.source_id=TRGT.source_id AND SRC.task_type = TRGT.task_type)
 where COALESCE( SRC.task_state,'')<> COALESCE(TRGT.task_state,'')
