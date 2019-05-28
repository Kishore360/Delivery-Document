select case when count(1) then 'FAILURE' else 'SUCCESS' end as RESULT,
case when count(1) then 'Data Mismatch' else 'SUCCESS' end as Message
from gilead_mdsdb.task_final a
left join gilead_mdwdb.d_task b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join gilead_mdsdb.incident_final inc
on a.sys_id=inc.sys_id and a.sourceinstance=inc.sourceinstance
where  CASE WHEN inc.sys_id IS NOT NULL THEN IF(inc.reopen_count>0,'Y','N')  ELSE NULL END  <>b.reopened_flag_c
and b.soft_deleted_flag='N';