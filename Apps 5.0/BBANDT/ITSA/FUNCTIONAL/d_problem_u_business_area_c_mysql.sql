SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.u_business_area_c' ELSE 'SUCCESS' END as Message
 -- select CONVERT_TZ (src.sys_updated_on,'GMT','America/New_York'), trgt.sys_updated_on
 FROM bbandt_mdsdb.problem_final src 
 join bbandt_mdwdb.d_problem trgt
  ON   src.sys_id=trgt.row_id 
  and trgt.source_id = src.sourceinstance
 WHERE COALESCE(src.u_business_area,'UNSPECIFIED')<>trgt.u_business_area_c
 and src.cdctype='X';