select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for f_outage' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_outage_task
where (transaction_key, row_key) not in
(
select 
COALESCE(case when f_ot.transaction_type='INCIDENT' then COALESCE(d_inc.row_key,0)
when f_ot.transaction_type='CHANGE_REQUEST' then COALESCE(d_chng.row_key,0)
when f_ot.transaction_type='PROBLEM' then COALESCE(d_prob.row_key,0) end,0) transaction_key,
f_ot.row_key
from <<tenant>>_mdwdb.f_outage_task f_ot
left join <<tenant>>_mdwdb.d_task d_t
on f_ot.task_key = d_t.row_key
left join <<tenant>>_mdwdb.d_incident d_inc
on d_t.row_id = d_inc.row_id
left join <<tenant>>_mdwdb.d_change_request d_chng
on d_t.row_id = d_chng.row_id
left join <<tenant>>_mdwdb.d_problem d_prob
on d_t.row_id = d_prob.row_id
)
and row_key not in (0,-1);
