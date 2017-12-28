SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

gilead_mdsdb.u_task_fss_final a
join gilead_mdwdb.d_task_fss_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.sparc_active_flag<> case when a.u_sparc_active='0' then 'N' else 'Y' end;