SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_end_on_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.incident_final SRC
 LEFT JOIN molinahealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN molinahealth_mdwdb.d_calendar_time LKP 
on (LKP.row_id = date_format(convert_tz(SRC.u_outage_end ,'GMT','America/Los_Angeles'),'%Y%m%d') and LKP.source_id=0)
 WHERE (LKP.row_key,case when SRC.u_outage_end is null then 0 else -1 )<>(TRGT.outage_end_time_key)
