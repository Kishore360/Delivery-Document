SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from molinahealth_mdsdb.task_final SRC
left join
molinahealth_mdwdb.d_internal_contact LKP
on concat('INTERNAL_CONTACT~',SRC.assignment_group_manager) = LKP.row_id
join
molinahealth_mdwdb.f_task_c TRGT
on SRC.sys_id=right(TRGT.row_id,32) and SRC.sourceinstance=TRGT.source_id
where coalesce(LKP.row_key,case when SRC.assignment_group_manager is null then 0 else -1 end)<>TRGT.org_manager_c_key


