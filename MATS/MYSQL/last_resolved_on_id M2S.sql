


SELECT CASE WHEN cnt >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'fs_incident has invalid last_resolved_on_id ' ELSE 'SUCCESS' END as Message
from(
Select count(*) cnt from 
(select sys_id ,sourceinstance,row_id ,source_id ,last_resolved_on_id,
CASE WHEN DATE_FORMAT(CONVERT_TZ(u_resolved_date,'GMT','America/Los_Angeles'),'%Y')<2000 then
(DATE_FORMAT(CONVERT_TZ(u_resolved_date,'GMT','America/Los_Angeles'),'%Y%m%d')+20000000) else
DATE_FORMAT(CONVERT_TZ(u_resolved_date,'GMT','America/Los_Angeles'),'%Y%m%d') end as u_resolved_date
FROM uclahealth_mdsdb.incident_final
join uclahealth_workdb.fs_incident on sys_id=row_id and sourceinstance=source_id and u_resolved_date is not null
)a
where u_resolved_date <> last_resolved_on_id )b

