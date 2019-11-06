
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset_class.created_on' ELSE 'SUCCESS' END as Message
  FROM whirlpool_mdsdb.sys_db_object SRC 
 LEFT JOIN whirlpool_mdwdb.d_asset_class TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE convert_tz(SRC.sys_created_on,'GMT','America/New_York') <> TRGT.created_on and SRC.cdctype='X'
