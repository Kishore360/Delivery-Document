SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.dormant_flag' ELSE 'SUCCESS' END as Message
 FROM   ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_task_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_problem_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM 
ON concat('STATE~PROBLEM_TASK~',upper(SRC.state))=LM.src_rowid
and LM.dimension_class='STATE~PROBLEM_TASK'
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 )   FRESH 
 ON(FRESH.source_id=SRC.sourceinstance) 
 
 WHERE  CASE WHEN timestampdiff(DAY,SRC.sys_updated_on,convert_tz(FRESH.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))>30
AND  LM.dimension_wh_code='OPEN' THEN 'Y' ELSE 'N' END  <> COALESCE(TRGT.dormant_flag ,'');

