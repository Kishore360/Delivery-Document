SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_problem.open_to_resolve_duration' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM svb_mdsdb.problem_final SRC
  JOIN svb_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN svb_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ('OPEN','RESOLVED')
AND TIMESTAMPDIFF(SECOND,SRC.sys_created_on,(SELECT CONVERT_TZ(max(lastupdated),'GMT','America/Los_Angeles') 
AS lastupdated FROM svb_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'
 and etl_run_number=TRGT.etl_run_number))  <> TRGT.open_days_duration_c)b

