

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.request_number' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM ibmwatson_mdsdb.sc_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ibmwatson_mdwdb.d_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.number ,'')<> COALESCE(TRGT.request_number_c ,'')
