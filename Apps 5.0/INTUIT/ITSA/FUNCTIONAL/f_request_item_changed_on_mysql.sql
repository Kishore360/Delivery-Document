

 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.changed_on' ELSE 'SUCCESS' END as Message  FROM intuit_mdsdb.sc_req_item_final SRC  
 LEFT JOIN intuit_mdwdb.f_request_item TRGT  ON (SRC.sys_id =TRGT.row_id   
 AND SRC.sourceinstance= TRGT.source_id AND TRGT.soft_deleted_flag = 'N' ) 
 WHERE convert_tz(SRC.sys_updated_on,"GMT","America/Los_Angeles")<> TRGT.changed_on 