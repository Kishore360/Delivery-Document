select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'TRANSACTION_TYPE validation failed for d_outage' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_outage_task
where (TRANSACTION_TYPE, row_id) not in
(
select t.sys_class_name, ot.sys_id
from <<tenant>>_mdsdb.task_final t
left join <<tenant>>_mdsdb.task_outage_final ot
on ot.task = t.sys_id
)
