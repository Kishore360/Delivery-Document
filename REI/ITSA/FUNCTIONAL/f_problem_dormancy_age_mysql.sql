 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.dormancy_age' ELSE 'SUCCESS' END as Message
 FROM rei_mdsdb.problem_final SRC 
 LEFT JOIN rei_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join rei_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 where lm.dimension_class = 'STATE~PROBLEM'
AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(TIMESTAMPDIFF(second,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM rei_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),'America/Los_Angeles','GMT')),0)<> TRGT.dormancy_age_c;
 