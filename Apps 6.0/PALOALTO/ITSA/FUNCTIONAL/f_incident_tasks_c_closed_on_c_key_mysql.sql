SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_tasks_c.closed_on_c_key' ELSE 'SUCCESS' END as Message 
from paloalto_mdwdb.f_incident_tasks_c f
join paloalto_mdsdb.u_incident_tasks_final i ON f.row_id=i.sys_id AND f.source_id=i.sourceinstance
where
DATE_FORMAT(CONVERT_TZ(i.closed_at,'GMT' ,'America/Los_Angeles'),'%Y%m%d') <> f.closed_on_c_key