SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (SELECT count(1) as cnt
FROM homedepot_mdsdb.problem_final SRC 
 LEFT JOIN homedepot_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN homedepot_mdwdb.d_lov LKP 
 ON ( concat('PRIORITY~PROBLEM~~~',priority)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<>TRGT.priority_src_key)temp;