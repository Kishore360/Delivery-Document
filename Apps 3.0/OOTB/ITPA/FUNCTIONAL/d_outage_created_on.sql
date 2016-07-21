
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_outage.created_on' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_outage TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE convert_tz(SRC.sys_created_on,'GMT','America/Los_Angeles') <> TRGT.created_on 