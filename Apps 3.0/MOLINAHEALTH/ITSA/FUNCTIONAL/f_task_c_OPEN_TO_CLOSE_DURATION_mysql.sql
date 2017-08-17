SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from molinahealth_mdsdb.task_final SRC
join
molinahealth_mdwdb.f_task_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where CASE WHEN (SRC.opened_at is null or SRC.closed_at is null) THEN NULL
	 WHEN TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) < 0 THEN NULL
	  ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) end <>TRGT.OPEN_TO_CLOSE_DURATION