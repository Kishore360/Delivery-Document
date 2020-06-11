

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.created_on' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM firstam_mdsdb.problem_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN firstam_mdwdb.f_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE convert_tz(SRC.sys_created_on,'UTC', 'US/Pacific') <> TRGT.created_on 
