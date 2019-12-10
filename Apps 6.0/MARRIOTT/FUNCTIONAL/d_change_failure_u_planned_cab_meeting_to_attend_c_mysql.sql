select CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_change_request.u_planned_cab_meeting_to_attend_c' ELSE 'SUCCESS' END as Message
from marriott_mdsdb.change_request_final s  
left join marriott_mdwdb.d_change_request t  on t.row_id=s.sys_id and t.source_id=s.sourceinstance
where s.cdctype<>'D' and 
u_planned_cab_meeting_to_attend_c<>convert_tz(u_planned_cab_meeting_to_attend,'UTC','America/New_York');