SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.source_id' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.alm_asset SRC 
 LEFT JOIN usf_mdwdb.f_asset_status_history TRGT 
 ON (CONCAT(SRC.sys_id,'~',DATE_FORMAT(SRC.sys_created_on,'%Y%m%d%H%i%S') )  =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sourceinstance,'')<> COALESCE(TRGT.source_id ,'')
