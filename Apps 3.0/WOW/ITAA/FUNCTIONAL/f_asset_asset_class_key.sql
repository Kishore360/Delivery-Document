
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_class_key' ELSE 'SUCCESS' END 
as Message
 FROM wow_mdsdb.alm_asset_final  SRC 
 LEFT JOIN wow_mdwdb.f_asset TRGT 
 ON (concat('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN wow_mdsdb.sys_db_object_final sys
 on sys.name=SRC.sys_class_name
 LEFT JOIN wow_mdwdb.d_asset_class LKP 
 ON ( (sys.sys_id )= (LKP.row_id )
AND SRC.sourceinstance )= (LKP.source_id ))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_class_name IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.asset_class_key,'');
