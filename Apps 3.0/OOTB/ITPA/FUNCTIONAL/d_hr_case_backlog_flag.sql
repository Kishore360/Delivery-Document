
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_hr_case.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.hr_case_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_hr_case TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  LEFT JOIN  <<tenant>>_mdwdb.f_hr_case TRGTF 
 ON (TRGTF.hr_case_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key 
WHERE COALESCE( CASE WHEN LM.dimension_wh_code NOT IN('RESOLVED','CLOSED','CANCELLED') THEN 'Y' ELSE 'N' END ,'')<> COALESCE(TRGT.backlog_flag ,'')

