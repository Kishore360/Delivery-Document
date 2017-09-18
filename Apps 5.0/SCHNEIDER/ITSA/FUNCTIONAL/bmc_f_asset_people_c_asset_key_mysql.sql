
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_key' ELSE 'SUCCESS' END as Message
  FROM  schneider_mdsdb.ast_assetpeople_final SRC 
  JOIN schneider_mdwdb.f_asset_people_c TRGT 
 ON (SRC.instanceid=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN schneider_mdwdb.d_asset LKP 
 ON ( SRC.assetinstanceid = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assetinstanceid IS NULL THEN 0 else '-1' end)<> (TRGT.asset_key);


 
 