select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for f_outage' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.f_outage_task
where (transaction_type, row_key) not in
(
select 
COALESCE(case when f_ot.transaction_type='INCIDENT' then COALESCE(d_inc.row_key,0)
when f_ot.transaction_type='CHANGE_REQUEST' then COALESCE(d_chng.row_key,0)
when f_ot.transaction_type='PROBLEM' then COALESCE(d_prob.row_key,0) end,0) transaction_key,
f_ot.row_key
from #DWH_TABLE_SCHEMA.f_outage_task f_ot
left join #DWH_TABLE_SCHEMA.d_task d_t
on f_ot.task_key = d_t.row_key AND d_t.source_id =  f_ot.source_id and (CASE 
						WHEN f_ot.cdctype = 'D' THEN 'Y' 
						ELSE 'N' END)
left join #DWH_TABLE_SCHEMA.d_incident d_inc
on d_t.row_id = d_inc.row_id AND d_t.source_id =  d_inc.source_id 
left join #DWH_TABLE_SCHEMA.d_change_request d_chng
on d_t.row_id = d_chng.row_id AND d_t.source_id =  d_chng.source_id 
left join #DWH_TABLE_SCHEMA.d_problem d_prob
on d_t.row_id = d_prob.row_id AND d_t.source_id =  d_prob.source_id 
)
and row_key not in (0,-1);