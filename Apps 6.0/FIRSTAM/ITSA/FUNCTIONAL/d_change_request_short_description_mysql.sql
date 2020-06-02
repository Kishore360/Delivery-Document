 SELECT
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message
 FROM 
 (SELECT count(1) as CNT
 FROM 
 firstam_mdsdb.change_request_final SRC 
 LEFT JOIN firstam_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE char_length(SRC.short_description)<=255 and SRC.short_description<>TRGT.short_description)temp;