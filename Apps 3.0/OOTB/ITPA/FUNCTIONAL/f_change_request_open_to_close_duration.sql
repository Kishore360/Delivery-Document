
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE CASE WHEN SRC.opened_at > SRC.closed_at 
 or TIMESTAMPDIFF(SECOND, SRC.opened_at, SRC.closed_at) >'214748364' then '' else
 
  COALESCE( TIMESTAMPDIFF(SECOND, SRC.opened_at, SRC.closed_at) ,'')
 end
 <> COALESCE(TRGT.open_to_close_duration ,'')
