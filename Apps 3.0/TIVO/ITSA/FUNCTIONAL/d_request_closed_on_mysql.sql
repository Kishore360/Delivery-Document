SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.closed_on' ELSE 'SUCCESS' END as Message 
 FROM tivo_mdsdb.sc_req_item_final SRC  
LEFT JOIN tivo_mdwdb.d_request TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),'GMT','America/Los_Angeles')
<> TRGT.closed_on 

