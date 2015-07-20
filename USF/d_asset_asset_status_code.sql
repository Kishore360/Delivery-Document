
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.asset_status_code' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.alm_asset SRC 
 LEFT JOIN usf_mdwdb.d_asset TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.install_status,'')<> COALESCE(TRGT.asset_status_code ,'')
