
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.planned_duration' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE 
 
 case when SRC.start_date>SRC.end_date or TIMESTAMPDIFF(SECOND, SRC.start_date, SRC.end_date) >'214748364'
 then '' else
 COALESCE( TIMESTAMPDIFF(SECOND, SRC.start_date, SRC.end_date) ,'')end <> COALESCE(TRGT.planned_duration ,'')
