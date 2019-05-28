select case when count(1) then 'FAILURE' else 'SUCCESS' end as RESULT,
case when count(1) then 'Data Mismatch' else 'SUCCESS' end as Message
from gilead_mdsdb.contract_sla_final a
join gilead_mdwdb.d_task_sla b on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where coalesce(a.stop_condition,'UNSPECIFIED') <>b.stop_condition_c
and b.soft_deleted_flag='N';