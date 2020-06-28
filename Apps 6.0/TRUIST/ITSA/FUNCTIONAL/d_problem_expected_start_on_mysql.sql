SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (select * from truist_mdsdb.problem_final where cdctype<>'D') SRC 
 LEFT JOIN truist_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE CONVERT_TZ(SRC.expected_start,'GMT','America/New_York')<>TRGT.expected_start_on
 and SRC.CDCTYPE  <>'D'