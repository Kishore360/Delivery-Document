SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt 
from cardinalhealth_mdsdb.task_final SRC
JOIN  cardinalhealth_mdwdb.f_incident_activity TRGT
on  SRC.sys_id =  TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join cardinalhealth_mdwdb.d_task LKP
on SRC.  = LKP.row_id and SRC.sourceinstance=LKP.source_id
where coalesce(LKP.row_key,case when SRC. is null then 0 else -1 end)<> TRGT.task_c_key)a