
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.changed_on' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.alm_asset SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE convert_tz(SRC.sys_updated_on,'GMT','America/Los_Angeles') <> TRGT.changed_on 