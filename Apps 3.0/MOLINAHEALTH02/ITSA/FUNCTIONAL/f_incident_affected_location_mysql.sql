SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_end_on_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.incident_final SRC
 LEFT JOIN molinahealth_mdwdb.f_incident_affected_location_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN molinahealth_mdwdb.d_location LKP 
on (LKP.row_id = SRC.u_affected_location )
 WHERE (LKP.row_key,case when SRC.u_affected_location is null then 0 else -1 )<>(TRGT.location_key)
