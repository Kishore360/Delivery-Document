SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from (select count(1) cnt  
 FROM  svb_mdsdb.problem_final sam 
JOIN  svb_mdwdb.d_problem b
ON sam.sys_id = b.row_id and sam.sourceinstance=b.source_id
where 
sam.short_description<>b.short_description)b