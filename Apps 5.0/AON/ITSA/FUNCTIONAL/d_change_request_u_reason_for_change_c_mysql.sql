SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_change_request.u_reason_for_change_c' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM  aon_mdsdb.change_request_final SRC 
 LEFT JOIN   aon_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id )
where (SRC.u_reason_for_change)
<> TRGT.u_reason_for_change_c)temp;



 
