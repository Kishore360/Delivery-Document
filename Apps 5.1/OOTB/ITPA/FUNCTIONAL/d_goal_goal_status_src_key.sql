
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_goal.goal_status_src_key' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.goal_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_goal TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( concat('GOAL~','STATE~','~',SRC.state) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.goal_status_src_key ,'')
