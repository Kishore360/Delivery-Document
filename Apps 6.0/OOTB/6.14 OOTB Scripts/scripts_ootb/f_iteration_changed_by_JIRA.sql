SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_iteration.changed_by' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.f_iteration_temp SRC
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_iteration TRGT 
 ON (SRC.row_id = TRGT.row_id 
 AND SRC.source_id=TRGT.source_id)
 
 WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.changed_by, '')<> COALESCE(TRGT.changed_by ,'');