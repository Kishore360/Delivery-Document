SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM   qualcomm_mdsdb.incident_final SRC 
  JOIN   qualcomm_mdwdb.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
where  CASE 
                WHEN SRC.time_worked is null  THEN NULL   
                WHEN TIMESTAMPDIFF(SECOND,
                '1970-01-01 00:00:00',
                SRC.time_worked) < 0 THEN NULL    
                ELSE TIMESTAMPDIFF(SECOND,
                '1970-01-01 00:00:00',
                SRC.time_worked) 
            end <>(TRGT.time_worked )and SRC.CDCTYPE='X'
			
			
			