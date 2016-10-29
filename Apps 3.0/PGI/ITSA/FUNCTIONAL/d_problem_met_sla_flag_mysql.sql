

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.met_sla_flag' ELSE 'SUCCESS' END as Message from
 (
 SELECT a.sys_id, 
    a.sourceinstance,
    CASE WHEN SUM(b.has_breached)>0 THEN 0 ELSE 1 END As made_sla
 FROM pgi_mdsdb.problem_final a 
 LEFT JOIN pgi_mdsdb.task_sla_final b
 on b.task=a.sys_id
 GROUP BY b.task) SRC
 LEFT JOIN pgi_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( CASE WHEN SRC.made_sla = 0 then 'N' else 'Y' END,'')<> COALESCE(TRGT.met_sla_flag ,'')

 