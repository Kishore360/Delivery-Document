
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_goal.created_on' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.goal_final SRC 
  
 LEFT JOIN <<tenant>>_mdwdb.d_goal TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE(convert_tz(SRC.sys_created_on,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>) ,'')<> COALESCE(TRGT.created_on ,'');

