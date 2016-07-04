SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_activity.created_by' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sys_audit_final SRC 
  -- right join done assuming rowcount is validated
 RIGHT JOIN <<tenant>>_mdwdb.f_incident_activity TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN app_test.lsm_ls_source_timezone tz 
		ON (tz.sourceid = 2)
 WHERE coalesce(TRGT.primary_sequence_id,'') <>0
 AND COALESCE( convert_tz(SRC.sys_created_on,tz.source_time_zone,tz.target_time_zone),'')<> COALESCE(TRGT.created_on,'')
 
 


