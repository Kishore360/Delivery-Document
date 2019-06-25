 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_task.parent_age_at_closure' ELSE 'SUCCESS' END as Message
FROM mcdonalds_mdwdb.f_incident_task_c TRGT 
JOIN mcdonalds_mdwdb.d_incident_task_c d ON d.row_key = TRGT.incident_task_key and d.source_id = TRGT.source_id
JOIN mcdonalds_mdwdb.d_incident_request par ON par.row_key = TRGT.incident_request_key
where TRGT.Parent_Age_At_Task_closure  <> CASE WHEN d.closed_on > par.opened_on 
THEN TIMESTAMPDIFF(SECOND, CONVERT_TZ(par.opened_on,'America/Los_Angeles', 'GMT'),
CONVERT_TZ(d.closed_on,'America/Los_Angeles', 'GMT')) else 0 END
and ( TRGT.Parent_Age_At_Task_Closure IS NULL OR TRGT.Parent_Age_At_Task_Closure <> 
CASE WHEN d.closed_on > par.opened_on THEN TIMESTAMPDIFF(SECOND, CONVERT_TZ(par.opened_on,'America/Los_Angeles', 'GMT'),
CONVERT_TZ(d.closed_on,'America/Los_Angeles', 'GMT')) else 0 END);
