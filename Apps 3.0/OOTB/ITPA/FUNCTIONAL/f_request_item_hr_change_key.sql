

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.hr_change_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN <<tenant>>_mdsdb.sc_request_final REQ 
 ON (SRC.request  =REQ.sys_id  
 AND SRC.sourceinstance = REQ.sourceinstance  )
 LEFT JOIN <<tenant>>_mdwdb.d_hr_change HR 
 ON (REQ.parent  =HR.row_id  
 AND REQ.sourceinstance = HR.source_id  )
 
 WHERE COALESCE(HR.row_key,CASE WHEN REQ.parent IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.hr_change_key,'')
