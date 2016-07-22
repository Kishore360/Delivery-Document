SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (SELECT count(1) as cnt
FROM homedepot_mdsdb.problem_final SRC 
 LEFT JOIN homedepot_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN homedepot_mdwdb.d_lov LKP 
 ON ( concat('APPROVAL_C~PROBLEM~~~',approval)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval IS NULL THEN 0 else -1 end)<>TRGT.approval_src_c_key)temp; 


-- changed 'APPROVAL~PROBLEM~~~' to 'APPROVAL_C~PROBLEM~~~'