select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for incident_key from contract_sla_final to d_task_sla' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.task_sla_final S

left join <<tenant>>_mdsdb.task_final task ON S.task = task.sys_id 

left join <<tenant>>_mdwdb.d_incident INC on INC.row_id = COALESCE(S.task,'UNSPECIFIED') and upper(task.sys_class_name)  ='INCIDENT'

left join <<tenant>>_mdwdb.f_task_sla DWH on S.sys_id = DWH.row_id and S.sourceinstance = DWH.source_id

where ifnull(case when (S.task is null) or upper(task.sys_class_name) is null then 0
when S.task is not null and upper(task.sys_class_name) <> 'INCIDENT' then 0 
when INC.row_key is null and upper(task.sys_class_name) = 'INCIDENT' then -1 else INC.row_key end,'') <> ifnull(DWH.incident_key,'');

