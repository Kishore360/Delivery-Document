
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.downtime_c' ELSE 'SUCCESS' END as Message
<<<<<<< HEAD
 FROM pan_mdsdb.incident_final SRC 
 LEFT JOIN pan_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE TRGT.downtime_c <> TIMESTAMPDIFF(second,CONVERT_TZ(SRC.u_actual_start_time,'America/Los_Angeles','GMT'),CONVERT_TZ(SRC.u_restore,'America/Los_Angeles','GMT'))  
=======
 FROM pan_mdsdb.incident_final SRC
JOIN pan_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where downtime_c <> TIMESTAMPDIFF(second,CONVERT_TZ(u_actual_start_time,
            'GMT',
            'America/Los_Angeles'),
            CONVERT_TZ(u_restore,
            'GMT',
            'America/Los_Angeles'))

>>>>>>> 1329ffe96eee3e0f0e0f4dfd0b2402988b42fd62