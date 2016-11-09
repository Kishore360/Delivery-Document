SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.approval_src_c_key' ELSE 'SUCCESS' END as Message
 FROM homedepot_mdsdb.problem_final SRC 
 JOIN homedepot_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
join homedepot_mdwdb.d_lov LKP
on COALESCE(CONCAT('APPROVAL_C~PROBLEM~~~',UPPER(SRC.APPROVAL)),'UNSPECIFIED') = LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.APPROVAL IS NULL THEN 0 else -1 end) <> TRGT.approval_src_c_key