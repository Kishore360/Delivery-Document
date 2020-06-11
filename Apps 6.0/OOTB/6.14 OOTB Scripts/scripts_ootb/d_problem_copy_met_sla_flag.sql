SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.met_sla_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.problem_final_copy SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_problem TRGT 
 ON (SRC.`sys.id`=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 WHERE COALESCE( CASE WHEN `made.sla` = 1 then 'Y' else 'N' END ,'')<> COALESCE(TRGT.met_sla_flag ,'');