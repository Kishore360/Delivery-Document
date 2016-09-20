

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.stage_src_key' ELSE 'SUCCESS' END as Message
 FROM tivo_mdsdb.sc_req_item_final SRC 
 LEFT JOIN tivo_mdwdb.f_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN tivo_mdwdb.d_lov LKP 
 ON ( concat('STAGE','~','SC_REQ_ITEM','~','~','~',upper(stage))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.stage IS NULL THEN 0 else -1 end)<> (TRGT.stage_src_key)
