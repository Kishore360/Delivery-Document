SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.user_facing_c_key' ELSE 'SUCCESS' END as Message
FROM (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN tjxco_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN tjxco_mdwdb.d_lov LKP 
 ON ( concat('USER_FACING','~','CHANGE_REQUEST','~',upper(u_user_facing))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_user_facing IS NULL THEN 0 else -1 end) <> (TRGT.change_request_user_facing_c_key);
