SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM  
molinahealth02_mdwdb.d_problem TRGT 
  JOIN  molinahealth02_mdwdb.f_problem TRGTF 
 ON (TRGTF.problem_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
JOIN molinahealth02_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key 
WHERE dimension_class='STATE~PROBLEM'  and  CASE WHEN LM.dimension_wh_code IN('OPEN') THEN 'Y' ELSE 'N' END<> (TRGT.backlog_flag)

