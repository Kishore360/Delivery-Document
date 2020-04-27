
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.planned_start_on' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM ge_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ge_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE  convert_tz(SRC.start_date,'UTC','US/Central') <>  TRGT.planned_start_on 
