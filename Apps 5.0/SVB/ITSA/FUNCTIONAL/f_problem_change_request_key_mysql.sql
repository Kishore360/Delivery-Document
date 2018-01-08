
SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Message 
FROM    svb_mdsdb.problem_final SRC 
JOIN  svb_mdwdb.f_problem TRGT 
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
join svb_mdwdb.d_change_request lkp
on SRC.rfc=lkp.row_id and SRC.sourceinstance = lkp.source_id
WHERE coalesce(lkp.row_key,case when SRC.rfc is NULL then 0 else -1 end) <> TRGT.change_request_key



