SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.approved_on' ELSE 'SUCCESS' END as Message
 FROM gogo_mdsdb.change_request_final SRC 
 LEFT JOIN gogo_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where COALESCE(CONVERT_TZ(SRC.sys_created_on,"GMT","America/Chicago"),'')
<> TRGT.created_on;