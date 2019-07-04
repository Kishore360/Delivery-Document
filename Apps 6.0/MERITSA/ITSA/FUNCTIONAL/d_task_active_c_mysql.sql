SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message

from meritsa_mdsdb.task_final SRC
join
meritsa_mdwdb.d_task TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where case when SRC.active=1 then 'Y' else 'N' end <>TRGT.active_c_flag
AND SRC.CDCTYPE='X'
