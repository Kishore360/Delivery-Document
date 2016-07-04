
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for contract_sla_final to d_task_sla' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.task_sla_final S
join app_test.lsm_ls_source_timezone L  
on (S.sourceinstance = L.sourceid)

left join <<tenant>>_mdsdb.task_final task ON S.task = task.sys_id 

left join <<tenant>>_mdwdb.d_task_sla D on D.row_id = S.sla

left join <<tenant>>_mdwdb.d_incident INC on INC.row_id = COALESCE(S.task,'UNSPECIFIED') and upper(task.sys_class_name)  ='INCIDENT'

left join <<tenant>>_mdwdb.d_problem PROB on PROB.row_id = COALESCE(S.task,'UNSPECIFIED') and upper(task.sys_class_name)  ='PROBLEM'

left join <<tenant>>_mdwdb.d_request REQ on REQ.row_id = COALESCE(S.task,'UNSPECIFIED') and upper(task.sys_class_name)  ='REQUEST'

left join <<tenant>>_mdwdb.d_request_item REQ_ITEM on REQ_ITEM.row_id = COALESCE(S.task,'UNSPECIFIED') and upper(task.sys_class_name)  ='REQUEST_ITEM'

left join <<tenant>>_mdwdb.d_request_task REQ_TASK on REQ_TASK.row_id = COALESCE(S.task,'UNSPECIFIED') and upper(task.sys_class_name)  ='REQUEST_TASK'

left join <<tenant>>_mdwdb.d_problem_task PROB_TASK on PROB_TASK.row_id = COALESCE(S.task,'UNSPECIFIED') and upper(task.sys_class_name)  ='PROBLEM_TASK'

where (concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(upper(task.sys_class_name),''),
ifnull(D.row_key,''),
ifnull(case when (S.task is null) or upper(task.sys_class_name) is null then 0
when S.task is not null and upper(task.sys_class_name) <> 'INCIDENT' then 0 
when INC.row_key is null and upper(task.sys_class_name) = 'INCIDENT' then -1 else INC.row_key end,''),
ifnull(case when (S.task is null) or upper(task.sys_class_name) is null then 0
when S.task is not null and upper(task.sys_class_name) <> 'PROBLEM' then 0 
when PROB.row_key is null and upper(task.sys_class_name) = 'PROBLEM' then -1 else PROB.row_key end,''),
ifnull(case when (S.task is null) or upper(task.sys_class_name) is null then 0
when S.task is not null and upper(task.sys_class_name) <> 'REQUEST' then 0 
when REQ.row_key is null and upper(task.sys_class_name) = 'REQUEST' then -1 else REQ.row_key end,''),
ifnull(case when (S.task is null) or upper(task.sys_class_name) is null then 0
when S.task is not null and upper(task.sys_class_name) <> 'REQUEST_ITEM' then 0 
when REQ_ITEM.row_key is null and upper(task.sys_class_name) = 'REQUEST_ITEM' then -1 else REQ_ITEM.row_key end,''),
ifnull(case when (S.task is null) or upper(task.sys_class_name) is null then 0
when S.task is not null and upper(task.sys_class_name) <> 'REQUEST_TASK' then 0 
when REQ_TASK.row_key is null and upper(task.sys_class_name) = 'REQUEST_TASK' then -1 else REQ_TASK.row_key end,''),
ifnull(case when (S.task is null) or upper(task.sys_class_name) is null then 0
when S.task is not null and upper(task.sys_class_name) <> 'PROBLEM_TASK' then 0 
when PROB_TASK.row_key is null and upper(task.sys_class_name) = 'PROBLEM_TASK' then -1 else PROB_TASK.row_key end,''),
ifnull(S.stage,''),
ifnull(case when upper(S.has_breached) in ('TRUE', 'Y', 'YES', 1) then 'Y' else 'N' end,''),
ifnull(CASE WHEN S.duration is null THEN NULL   
	 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',S.duration) < 0 THEN NULL    
	 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',S.duration) > 214748364 THEN NULL     
	 ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',S.duration) end,''),
ifnull(round(S.percentage,2),''),
ifnull(CASE WHEN S.pause_duration is null  THEN NULL   
     WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',S.pause_duration) < 0 THEN NULL    
	 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',S.pause_duration) > 214748364 THEN NULL     
	 ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00', S.pause_duration) end,''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''),
ifnull('N','')
)) not in (
select (concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.task_type,''),
ifnull(DWH.sla_key,''),
ifnull(DWH.incident_key,''),
ifnull(DWH.problem_key,''),
ifnull(DWH.request_key,''),
ifnull(DWH.request_item_key,''),
ifnull(DWH.request_task_key,''),
ifnull(DWH.problem_task_key,''),
ifnull(DWH.stage_src_code,''),
ifnull(DWH.outcome_flag,''),
ifnull(DWH.actual_duration,''),
ifnull(round(DWH.percentage_taken,2),''),
ifnull(DWH.pause_duration,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,''),
ifnull(DWH.exclude_flag,'')
)) from <<tenant>>_mdwdb.f_task_sla DWH);
