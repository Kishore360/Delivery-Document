SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_created_on' ELSE 'SUCCESS' END as Message
  FROM wow_mdsdb.alm_asset_final  SRC 
 LEFT JOIN wow_mdwdb.f_asset TRGT 
 ON ((concat('ASSET~',SRC.sys_id) ) =(TRGT.row_id )  AND (SRC.sourceinstance )= (TRGT.source_id ) )
 WHERE (CONVERT_TZ(SRC.sys_created_on,'GMT','MST') )<> TRGT.asset_created_on;