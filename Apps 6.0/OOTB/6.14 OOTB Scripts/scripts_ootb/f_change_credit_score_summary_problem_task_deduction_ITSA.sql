SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_credit_score_summary_base.problem_task_deduction' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #STG_TABLE_SCHEMA.f_change_credit_score_summary_base) SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_credit_score_summary TRGT 
 ON (SRC.row_id=TRGT.row_id AND SRC.source_id=TRGT.source_id) 
 where COALESCE( SRC.problem_task_deduction,'')<> COALESCE(TRGT.problem_task_deduction,'')
