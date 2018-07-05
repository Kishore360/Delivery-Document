SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_service_request.duration_c' ELSE 'SUCCESS' END as Message
 from
pan6_mdwdb.f_service_request_c f 
JOIN pan6_mdsdb.u_service_request_final a 
ON row_id = sys_id and sourceinstance=source_id
WHERE f.duration_c<>CASE WHEN a.calendar_duration is null  THEN NULL                    
WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',a.calendar_duration) < 0 THEN NULL                     
WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',a.calendar_duration) > 214748364 THEN NULL                  
ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00', a.calendar_duration) end   		
			
          
          