

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.state_src_code' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE COALESCE( SRC.state using utf8),'')<> COALESCE(TRGT.state_src_code using utf8),'')
