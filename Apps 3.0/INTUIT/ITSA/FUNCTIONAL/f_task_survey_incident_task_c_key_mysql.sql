SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from intuit_mdsdb.task_survey_final tsd
LEFT OUTER JOIN intuit_mdsdb.task_final t ON tsd.task = t.sys_id
left outer join intuit_mdsdb.sys_user_final usr on usr.sys_id =tsd.taken_by
left join intuit_workdb.f_task_survey dfts
on tsd.sys_id=dfts.row_id AND tsd.sourceinstance=dfts.source_id
LEFT JOIN intuit_workdb.d_incident_task_c b ON 
tsd.task=b.row_id and tsd.sourceinstance=b.source_id
where  CASE WHEN upper(t.sys_class_name) ='U_INCIDENT_TASK' THEN b.row_key
ELSE 0 END and dfts.incident_task_c_key <> b.row_key;