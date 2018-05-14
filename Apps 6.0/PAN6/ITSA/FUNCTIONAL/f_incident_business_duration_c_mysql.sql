SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 from
pan_mdwdb.f_incident f 
JOIN pan_mdsdb.incident_final a 
ON row_id = sys_id and sourceinstance=source_id
WHERE business_duration_c<>CASE WHEN business_stc is null  THEN NULL
			WHEN business_stc < 0 THEN NULL
			ELSE business_stc end
			
			
			