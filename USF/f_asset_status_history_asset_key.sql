
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.asset_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.alm_asset SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_asset_status_history TRGT 
 on (CONCAT(SRC.sys_id,'~',DATE_FORMAT(SRC.sys_created_on,'%Y%m%d%H%i%S') ) =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_asset LKP 
 ON ( SRC.sys_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.asset_key,'')

 
