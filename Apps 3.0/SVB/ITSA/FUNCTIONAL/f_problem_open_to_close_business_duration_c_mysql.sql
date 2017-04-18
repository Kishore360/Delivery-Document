SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_problem.open_to_resolve_duration' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM svb_mdsdb.problem_final SRC
  JOIN svb_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN svb_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ('CLOSED')
AND TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.sys_updated_on)  <> TRGT.open_to_close_business_duration_c)b

