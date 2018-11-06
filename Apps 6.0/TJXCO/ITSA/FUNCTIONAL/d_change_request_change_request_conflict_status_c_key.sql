SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.conflict_status' ELSE 'SUCCESS' END as Message
FROM (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN tjxco_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN tjxco_mdwdb.d_lov LKP 
 ON ( concat('CONFLICT_STATUS','~','CHANGE_REQUEST','~',upper(conflict_status))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.conflict_status IS NULL THEN 0 else -1 end) <> (TRGT.change_request_conflict_status_c_key);
