SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from mercuryins_mdsdb.task_final SRC
join
mercuryins_mdwdb.d_task TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where CONVERT_TZ(SRC.work_end,'GMT','America/Los_Angeles') <>TRGT.work_end_c