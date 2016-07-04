SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
 FROM tivo_mdsdb.change_request_final SRC
 LEFT JOIN tivo_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id )
where convert_tz(SRC.closed_at,'GMT','America/Los_Angeles')<>TRGT.CLOSED_ON