SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_substatus_key' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.alm_asset_final SRC 
 LEFT JOIN usf_mdwdb.f_asset TRGT 
 ON ( SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id) 
 LEFT JOIN usf_mdwdb.d_lov LKP 
 ON COALESCE(CONCAT('ASSET~SUBSTATUS~~',SRC.u_install_status),'UNSPECIFIED') =LKP.row_id 
AND (SRC.sourceinstance )= LKP.source_id 
AND LKP.dimension_class ='ASSET'
AND LKP.dimension_type = 'SUBSTATUS'
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_install_status IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.asset_substatus_key,'')