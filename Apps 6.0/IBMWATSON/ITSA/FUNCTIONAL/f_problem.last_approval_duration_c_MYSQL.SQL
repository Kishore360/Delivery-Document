
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.last_approval_duration_c' ELSE 'SUCCESS' END as Message
 from  ibmwatson_mdwdb.f_problem a
JOIN ibmwatson_mdsdb.problem_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance
JOIN ( SELECT documentkey,sourceinstance,max(sys_created_on) as created_on from 
ibmwatson_mdsdb.sys_audit_final 
where tablename ='problem' and fieldname ='state' and  newvalue =7
group by 1,2
) X
ON a.row_id = X.documentkey and a.source_id = X.sourceinstance
where  a.last_approval_duration_c<>CASE  WHEN b.opened_at is null THEN NULL   
                WHEN TIMESTAMPDIFF(SECOND,b.opened_at,X.created_on) < 0 THEN NULL    
                ELSE TIMESTAMPDIFF(SECOND,b.opened_at,X.created_on)end