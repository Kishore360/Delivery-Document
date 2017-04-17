
 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_problem.u_known_error_date_c
' ELSE 'SUCCESS' END as Message  
 FROM (select count(1)cnt from aon_mdsdb.problem_final SRC
 LEFT JOIN aon_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  WHERE COALESCE(CONVERT_TZ(SRC.u_known_error_date,'GMT','US/Central'),'')
<> (TRGT.u_known_error_date_c
))b;






