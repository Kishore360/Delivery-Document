SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_service_request.duration_c' ELSE 'SUCCESS' END as Message
 
from 
(select count(1) as cnt 
from 
(select sys_id, sourceinstance, calendar_duration from paloalto_mdsdb.u_service_request_final where CDCTYPE<>'D') a 

left join 
paloalto_mdwdb.f_service_request_c f 

ON a.sys_id=f.row_id and a.sourceinstance=f.source_id
 
WHERE CASE WHEN a.calendar_duration is null  THEN NULL                   

WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',a.calendar_duration) < 0 THEN NULL                    
 
WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',a.calendar_duration) > 214748364 THEN NULL                 
 
ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00', a.calendar_duration) end <> f.duration_c  ) temp; 		
			
          
          