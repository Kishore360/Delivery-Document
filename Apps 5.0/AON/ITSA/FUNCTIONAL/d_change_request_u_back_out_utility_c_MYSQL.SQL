SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_change_request.u_back_out_utility_c' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM aon_mdsdb.change_request_final SRC 
 LEFT JOIN  aon_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where SRC.u_back_out_utility
<> TRGT.u_back_out_utility_c)temp;

