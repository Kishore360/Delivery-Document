SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.expedited_change_c_flag' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.change_request_final  SRC JOIN whirlpool_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
 WHERE (CASE WHEN SRC.u_expedited_change = 1 then 'Y' else 'N' END) <> (TRGT.expedited_change_c_flag) and SRC.cdctype='X'
