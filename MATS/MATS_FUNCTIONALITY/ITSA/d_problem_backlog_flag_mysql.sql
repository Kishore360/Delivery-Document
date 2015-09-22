SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM  
<<tenant>>_mdwdb.d_problem TRGT 
  JOIN  <<tenant>>_mdwdb.f_problem TRGTF 
 ON (TRGTF.problem_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
JOIN <<tenant>>_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key 
WHERE dimension_class='STATE~PROBLEM'  and COALESCE( CASE WHEN LM.dimension_wh_code IN('OPEN') THEN 'Y' ELSE 'N' END,'')<> COALESCE(TRGT.backlog_flag ,'')

