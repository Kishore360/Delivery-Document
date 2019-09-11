 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.parent_age_at_open' ELSE 'SUCCESS' END as Message
FROM mcdonalds_mdwdb.f_change_task TRGT 
JOIN mcdonalds_mdwdb.d_change_task d ON d.row_key = TRGT.change_task_key and d.source_id = TRGT.source_id
JOIN mcdonalds_mdwdb.d_change_request par ON par.row_key = TRGT.change_request_key
where TRGT.Parent_Age_At_Task_Open  <> (CASE WHEN d.opened_on > par.opened_on THEN 
TIMESTAMPDIFF(SECOND, CONVERT_TZ(par.opened_on,'GMT', 'America/New_York'),
CONVERT_TZ(d.opened_on,'GMT', 'America/New_York'))
else 0 END) and ( TRGT.Parent_Age_At_Task_Open IS NULL OR TRGT.Parent_Age_At_Task_Open 
<> CASE WHEN d.opened_on > par.opened_on THEN 
TIMESTAMPDIFF(SECOND, CONVERT_TZ(par.opened_on,'GMT', 'America/New_York'),
CONVERT_TZ(d.opened_on,'GMT', 'America/New_York')) else 0 END);	
