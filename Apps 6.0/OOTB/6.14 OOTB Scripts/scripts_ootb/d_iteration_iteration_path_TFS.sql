SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_iteration.iteration_path' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.dimiteration_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_iteration TRGT 
 ON (SRC.IterationSK=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE TRGT.row_key not in (0,-1) and TRGT.soft_deleted_flag = 'N' and
COALESCE(SRC.iterationpath,'' )<> COALESCE(TRGT.iteration_path ,'');