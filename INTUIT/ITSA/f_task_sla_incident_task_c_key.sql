SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from  ( select count(1) as cnt
from intuit_mdsdb.task_sla_final tsd
LEFT OUTER JOIN intuit_mdsdb.task_final t
ON tsd.task = t.sys_id
left join intuit_workdb.f_task_sla dfts
on tsd.sys_id=dfts.row_id AND tsd.sourceinstance=dfts.source_id
LEFT JOIN intuit_workdb.d_incident_task_c b ON 
case when upper(t.sys_class_name)  ='U_INCIDENT_TASK' 
then COALESCE(tsd.task,'UNSPECIFIED') else 'UNSPECIFIED' END
=b.row_id and b.source_id = if (case when upper(t.sys_class_name)  ='U_INCIDENT_TASK' 
then COALESCE(tsd.task,'UNSPECIFIED') else 'UNSPECIFIED' END ='UNSPECIFIED',0,tsd.sourceinstance)
where  dfts.incident_task_c_key <> b.row_key) g;
