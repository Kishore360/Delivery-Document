SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message
 FROM homedepot_mdsdb.problem_final SRC 
 JOIN homedepot_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
join homedepot_mdwdb.d_internal_contact LKP
on COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.u_assigned_director),'UNSPECIFIED') = LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_assigned_director IS NULL THEN 0 else -1 end) <> TRGT.assigned_director_c_key