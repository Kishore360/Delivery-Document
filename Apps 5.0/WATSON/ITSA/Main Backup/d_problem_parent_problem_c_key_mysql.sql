
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_problem_region_list_c.pivot_date' ELSE 'SUCCESS' END as Message from (
 select count(1) cnt from 
-- select SRC.number,SRC.u_parent_problem, LKP.row_id ,COALESCE(LKP.row_key,CASE WHEN SRC.u_parent_problem IS NULL THEN 0 else -1 end),(TRGT.parent_problem_c_key) 
   watson_mdsdb.problem_final SRC 
 LEFT JOIN watson_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN watson_mdwdb.d_problem LKP 
 ON ( SRC.u_parent_problem= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE SRC.cdctype<>'D' and COALESCE(LKP.row_key,CASE WHEN SRC.u_parent_problem IS NULL THEN 0 else -1 end)<>(TRGT.parent_problem_c_key)
 )a;


