SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.incident_final SRC
 LEFT JOIN molinahealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN molinahealth_mdwdb.d_calendar_time LKP 
on (LKP.row_id = date_format(convert_tz(SRC.u_outage_start ,'GMT','America/Los_Angeles'),'%H%i') and LKP.source_id=0)
 WHERE coalesce(LKP.row_key,case when SRC.u_outage_start is null then 0 else -1 end)<>(TRGT.outage_start_time_key)
