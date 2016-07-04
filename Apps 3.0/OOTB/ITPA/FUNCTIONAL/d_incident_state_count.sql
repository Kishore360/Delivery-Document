
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_state_count' ELSE 'SUCCESS' END as Message
from 
(select 
f.soft_deleted_flag as soft_deleted_flag,f.incident_number as incident_number,f.row_key as row_key,count(1) as count,f.state_count as state_count
from <<tenant>>_mdwdb.f_incident_activity t
join <<tenant>>_mdwdb.d_incident f on t.task_key = f.row_key 
where t.task_wh_type = 'incident' and t.task_attribute_wh_name= 'state' and f.row_key <> -1
group by f.incident_number, f.row_key) SRC 
where  SRC.soft_deleted_flag = 'N' and 
coalesce(SRC.count,'')<> coalesce(SRC.state_count,'')
