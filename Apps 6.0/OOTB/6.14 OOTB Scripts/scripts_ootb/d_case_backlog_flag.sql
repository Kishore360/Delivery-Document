SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_customerservice_case_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_case TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  LEFT JOIN  #DWH_TABLE_SCHEMA.f_case TRGTF 
 ON (TRGTF.case_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key 
WHERE TRGT.row_key not in (0, -1) and 
COALESCE( CASE WHEN LM.dimension_wh_code NOT IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END ,'')<> COALESCE(TRGT.backlog_flag ,'')

