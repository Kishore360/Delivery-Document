

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message 
 FROM rei_mdsdb.change_task_final SRC 
 LEFT JOIN rei_mdwdb.d_change_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN  SRC.made_sla= TRUE THEN 'Y' ELSE 'N' END)<> (TRGT.met_sla_flag )
