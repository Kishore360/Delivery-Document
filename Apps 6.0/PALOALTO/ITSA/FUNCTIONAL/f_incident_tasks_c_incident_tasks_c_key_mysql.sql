SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_tasks_c.incident_tasks_c_key' ELSE 'SUCCESS' END as Message 
from paloalto_mdwdb.f_incident_tasks_c f
join paloalto_mdsdb.u_incident_tasks_final i ON f.row_id=i.sys_id AND f.source_id=i.sourceinstance
join paloalto_mdwdb.d_incident_tasks_c lkp
ON ( i.sys_id= lkp.row_id 
AND i.sourceinstance= lkp.source_id and lkp.soft_deleted_flag='N' )
WHERE coalesce(lkp.row_key,case when i.sys_id is NULL
then 0 else -1 end) <> f.incident_tasks_c_key