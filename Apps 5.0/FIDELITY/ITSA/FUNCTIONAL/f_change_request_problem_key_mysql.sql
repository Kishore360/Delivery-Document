SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.problem_key' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdsdb.change_request_final SRC
LEFT JOIN fidelity_mdwdb.d_problem TRGT 
ON (SRC.sourceinstance =TRGT.source_id 
and TRGT.u_problem= LKP.row_id )
JOIN fidelity_mdwdb.f_change_request trgt1
on SRC.sys_id = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
WHERE coalesce(LKP.row_key,case when SRC.u_problem is null then 0 else -1 end) <>trgt1.problem_key

