
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.location_key' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.alm_asset_final  SRC 
 LEFT JOIN wow_mdwdb.f_asset_status_history TRGT 
on ((CONCAT(concat('ASSET~',SRC.sys_id),'~',DATE_FORMAT(SRC.sys_created_on,'%Y%m%d%H%i%S') ) ) =(TRGT.row_id )
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN wow_mdwdb.d_location LKP 
 ON ( SRC.location )= (LKP.row_id )
AND SRC.sourceinstance )= (LKP.source_id ))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.location IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.location_key,'')
