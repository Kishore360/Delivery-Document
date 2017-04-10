SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.source_incident_c_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM aon_mdsdb.change_request_final SRC 
 LEFT JOIN   aon_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
join aon_mdwdb.d_lov LKP
on LKP.row_id=COALESCE(SRC.u_source_incident,'UNSPECIFIED')
where COALESCE(LKP.row_key,case when u_source_incident is null then 0 else -1 end )
<> TRGT.source_incident_c_key)temp;










   
 
