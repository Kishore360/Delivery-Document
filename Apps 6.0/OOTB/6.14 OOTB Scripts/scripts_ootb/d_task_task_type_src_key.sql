SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.task_type_src_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov L
 on concat('TASK_TYPE~TASK~',upper(SRC.sys_class_name)) = L.src_rowid 
 -- and L.dimension_class = 'TASK_TYPE~TASK'
WHERE COALESCE( L.row_key  , CASE WHEN   SRC.sys_class_name is null then 0 else -1 END ,'')<> COALESCE(TRGT.task_type_src_key ,'')

