SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
from
equifax_mdsdb.incident_final a
join
equifax_mdwdb.f_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where CASE 
WHEN a.sys_created_on is null then 0 
when a.u_actual_finish is null then 0 
WHEN TIMESTAMPDIFF(SECOND , a.sys_created_on, a.u_actual_finish) < 0 THEN 0 
ELSE TIMESTAMPDIFF(SECOND ,a.sys_created_on,a.u_actual_finish)   end<>created_to_actual_finish_duration_c and a.cdctype<>'D')b