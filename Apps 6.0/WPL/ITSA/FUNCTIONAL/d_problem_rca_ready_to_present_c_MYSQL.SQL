SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
  FROM( select count(1) as cnt from 
  wpl_mdsdb.problem_final SRC
  left join wpl_mdwdb.d_problem TRGT
  on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
  where CONVERT_TZ(SRC.u_rca_ready_time,'GMT','America/New_York')<>TRGT.rca_ready_to_present_c)ma

