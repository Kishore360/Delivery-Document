
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset_class.source_id' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.sys_db_object SRC 
 LEFT JOIN whirlpool_mdwdb.d_asset_class TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.sourceinstance ,'')<> COALESCE(TRGT.source_id ,'') and SRC.cdctype='X'
