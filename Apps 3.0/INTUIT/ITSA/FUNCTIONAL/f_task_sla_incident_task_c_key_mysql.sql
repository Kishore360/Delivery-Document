SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0  THEN 'Data did not Match.' ELSE 'Data Matched'  end As Result
from intuit_mdsdb.task_sla_final tsd
LEFT JOIN intuit_mdsdb.task_final t ON tsd.task = t.sys_id
LEFT JOIN intuit_mdwdb.f_task_sla dfts on tsd.sys_id=dfts.row_id 
  AND tsd.sourceinstance=dfts.source_id
LEFT JOIN intuit_mdwdb.d_incident_task_c b ON tsd.task = b.row_id and b.source_id = tsd.sourceinstance

WHERE COALESCE(b.row_key,CASE WHEN tsd.task IS NULL THEN 0 else -1 end)<> (dfts.incident_task_c_key)