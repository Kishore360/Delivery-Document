SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 
'MDS to DWH data validation failed for d_request.opened_on' ELSE 'SUCCESS' END as Message 
 FROM tivo_mdsdb.sc_req_item_final SRC 
 LEFT JOIN tivo_mdwdb.d_request TRGT 
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE DATE_FORMAT(convert_tz(SRC.opened_at,'GMT','America/Los_Angeles'),'%Y%m%d')
<> DATE_FORMAT(TRGT.opened_on,'%Y%m%d') 