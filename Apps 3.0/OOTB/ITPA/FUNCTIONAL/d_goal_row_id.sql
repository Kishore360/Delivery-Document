
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_goal.row_id' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.goal_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_goal TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.sys_id ,'')<> COALESCE(TRGT.row_id ,'')
