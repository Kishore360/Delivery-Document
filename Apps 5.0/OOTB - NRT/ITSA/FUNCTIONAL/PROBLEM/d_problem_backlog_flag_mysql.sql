SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem.backlog_flag' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
 FROM  <<tenant>>_mdwdb.d_problem TRGT 
  JOIN  <<tenant>>_mdwdb.f_problem TRGTF 
 ON (TRGTF.problem_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
JOIN <<tenant>>_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key 
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and dimension_class='STATE~PROBLEM'  and  CASE WHEN LM.dimension_wh_code IN('OPEN') THEN 'Y' ELSE 'N' END<> 
(TRGT.backlog_flag))temp;


