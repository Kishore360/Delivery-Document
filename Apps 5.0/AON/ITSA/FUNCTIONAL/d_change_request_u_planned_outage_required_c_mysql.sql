SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_change_request.u_planned_outage_required_c' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM aon_mdsdb.change_request_final SRC 
 LEFT JOIN  aon_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where COALESCE(CASE WHEN u_planned_outage_required =0 THEN 'N' ELSE 'Y' END)
<> TRGT.u_planned_outage_required_c)temp;







 
