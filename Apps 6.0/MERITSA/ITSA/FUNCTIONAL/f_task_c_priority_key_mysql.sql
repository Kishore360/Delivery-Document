SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from meritsa_mdsdb.task_final SRC
join
meritsa_mdwdb.f_task_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join
meritsa_mdwdb.d_lov LKP
on COALESCE( CONCAT('PRIORITY','~','TASK','~','~','~',UPPER(SRC.priority)),'UNSPECIFIED')= LKP.row_id and TRGT.source_id=LKP.source_id
where coalesce(LKP.row_key,case when SRC.priority is null then 0 else -1 end)<>TRGT.priority_key
