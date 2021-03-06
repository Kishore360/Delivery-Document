SELECT 


CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,


CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_change_request.cab_scheduled_for_approval_c' ELSE 'SUCCESS' END as Message 


FROM (SELECT count(1) as CNT
 
FROM 
(select sys_id,sourceinstance,u_cab_scheduled_for_approval  from pdchs_mdsdb.change_request_final where CDCTYPE<>'D') SRC 
 

LEFT JOIN pdchs_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 

where convert_tz(SRC.u_cab_scheduled_for_approval,'GMT','America/New_York') <> TRGT.cab_scheduled_for_approval_c) temp;