

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.reason_src_key' ELSE 'SUCCESS' END as Message from (select COALESCE(LKP.row_key,CASE WHEN SRC.reason IS NULL THEN 0 else '-1' end)abc, COALESCE(TRGT.reason_src_key,'')def
 FROM <<tenant>>_mdsdb.change_request_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id )
 LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( CONCAT('REASON','~','CHANGE_REQUEST','~','~','~',UPPER(reason))= LKP.src_rowid 
 
AND SRC.sourceinstance= LKP.source_id ))a
 WHERE abc<>def

