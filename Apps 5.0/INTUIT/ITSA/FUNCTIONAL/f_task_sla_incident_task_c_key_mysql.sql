SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0  THEN 'Data did not Match.' ELSE 'Data Matched'  end As Result
from intuit_mdsdb.task_sla_final tsd
LEFT JOIN intuit_mdsdb.task_final t ON tsd.task = t.sys_id
LEFT JOIN intuit_mdwdb.f_task_sla dfts on tsd.sys_id=dfts.row_id 
  AND tsd.sourceinstance=dfts.source_id and dfts.soft_deleted_flag='N'
LEFT JOIN intuit_mdwdb.d_incident_task_c b ON tsd.task = b.row_id and b.source_id = tsd.sourceinstance

WHERE CASE WHEN upper(t.sys_class_name) ='U_INCIDENT_TASK' THEN b.row_key
ELSE 0 end <> (dfts.incident_task_c_key)