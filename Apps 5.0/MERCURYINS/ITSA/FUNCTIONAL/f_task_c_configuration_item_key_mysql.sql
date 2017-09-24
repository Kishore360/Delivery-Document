

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from mercuryins_mdsdb.task_final SRC
join
mercuryins_mdwdb.f_task_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join
mercuryins_mdwdb.d_configuration_item LKP
on COALESCE(SRC.cmdb_ci,'UNSPECIFIED')= LKP.row_id and TRGT.source_id=LKP.source_id
where coalesce(LKP.row_key,case when SRC.cmdb_ci is null then 0 else -1 end)<>TRGT.configuration_item_key