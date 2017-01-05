SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

nbcu_mdsdb.task_final i
join nbcu_mdwdb.f_task_c d
on i.sys_id=d.row_id and i.sourceinstance=d.source_id
JOIN nbcu_mdwdb.d_request dr on d.row_id = dr.row_id and d.source_id = dr.source_id
   where  CASE 
           WHEN (dr.opened_on is null or coalesce(dr.fulfilled_on_c,dr.closed_on) is null) THEN NULL
           WHEN TIMESTAMPDIFF(SECOND,dr.opened_on,coalesce(dr.fulfilled_on_c,dr.closed_on)) < 0 THEN NULL
           ELSE TIMESTAMPDIFF(SECOND,dr.opened_on,coalesce(dr.fulfilled_on_c,dr.closed_on)) 
          END<>d.OPEN_TO_X_DURATION
	 
	 