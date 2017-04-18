 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_problem.type_src_key' ELSE 'SUCCESS'
 END as Message  
 FROM  (select count(1) as cnt from aon_mdsdb.problem_final SRC
 LEFT JOIN aon_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN aon_mdwdb.d_lov LKP 
 ON ( COALESCE(CONCAT('TYPE_C~PROBLEM~~~',SRC.u_type),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_type IS NULL THEN 0 else -1 end) 
<> (TRGT.type_src_key))b;



 