
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.unplanned_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM firstam_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN firstam_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE CASE WHEN  SRC.`type` = 'Emergency' OR SRC.start_date IS NULL
 THEN 'Y' ELSE 'N' END <> TRGT.unplanned_flag 
