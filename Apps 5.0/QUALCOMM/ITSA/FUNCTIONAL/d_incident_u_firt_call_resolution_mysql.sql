SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM  qualcomm_mdsdb.incident_final SRC 
  JOIN qualcomm_mdwdb.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
where CASE WHEN SRC.u_firt_call_resolution='Yes' then 'Yes' else 'No' end <>(TRGT.u_firt_call_resolution )

