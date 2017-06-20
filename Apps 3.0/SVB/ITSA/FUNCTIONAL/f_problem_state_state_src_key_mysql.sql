SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from (select count(1) cnt  
 FROM  svb_mdsdb.problem_final a
JOIN  svb_mdwdb.f_problem b
ON a.sys_id = b.row_id and a.sourceinstance=b.source_id
join svb_mdwdb.d_lov c
on COALESCE(CONCAT('STATE~STATE~PROBLEM~~~',UPPER(a.state)),'UNSPECIFIED')=c.row_id
where 
coalesce(c.row_key,case when a.state is null then 0 else -1 end )<>b.state_state_src_key)b