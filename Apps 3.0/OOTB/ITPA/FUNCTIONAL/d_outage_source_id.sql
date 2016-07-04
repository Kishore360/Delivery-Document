
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_outage.source_id' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_outage TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.sourceinstance ,'')<> COALESCE(TRGT.source_id ,'')
