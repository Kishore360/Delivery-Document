SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message
 FROM homedepot_mdsdb.problem_final SRC 
 JOIN homedepot_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE CASE WHEN SRC.u_rfc_required = TRUE THEN 'Y' ELSE 'N' END <> TRGT.rfc_required_c