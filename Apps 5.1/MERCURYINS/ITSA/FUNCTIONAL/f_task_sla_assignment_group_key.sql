SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdwdb.f_task_sla s
JOIN mercuryins_mdwdb.f_incident i ON s.incident_key=i.incident_key AND s.source_id=i.source_id
and TRIM(task_type) = 'INCIDENT'
where  s.sla_assignment_group_c_key <> i.assignment_group_key
union
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdwdb.f_task_sla s
JOIN mercuryins_mdwdb.f_problem i ON s.problem_key=i.problem_key AND s.source_id=i.source_id
and TRIM(task_type) = 'PROBLEM'
where  s.sla_assignment_group_c_key <> i.assignment_group_key
union
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdwdb.f_task_sla s
JOIN mercuryins_mdwdb.f_problem_task i ON s.problem_task_key=i.problem_task_key AND s.source_id=i.source_id
and TRIM(task_type) = 'PROBLEM_TASK'
where  s.sla_assignment_group_c_key <> i.assignment_group_key
union
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdwdb.f_task_sla s
JOIN mercuryins_mdwdb.f_request_task i ON s.request_task_key=i.request_task_key AND s.source_id=i.source_id
and TRIM(task_type) = 'SC_TASK'
where  s.sla_assignment_group_c_key <> i.assignment_group_key
union
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdwdb.f_task_sla s
JOIN mercuryins_mdwdb.f_request i ON s.request_key=i.request_key AND s.source_id=i.source_id
and TRIM(task_type) = 'SC_REQUEST'
where  s.sla_assignment_group_c_key <> i.assignment_group_key
union
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdwdb.f_task_sla s
JOIN mercuryins_mdwdb.f_request_item i ON s.request_item_key=i.request_item_key AND s.source_id=i.source_id
and TRIM(task_type) = 'SC_REQ_ITEM'
where  s.sla_assignment_group_c_key <> i.assignment_group_key
