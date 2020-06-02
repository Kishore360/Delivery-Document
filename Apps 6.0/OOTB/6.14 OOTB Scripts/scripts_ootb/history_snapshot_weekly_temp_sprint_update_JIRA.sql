-- Weekly base table work_item_iteration_key update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join (
select FACT.work_item_key, base.issueid, FACT.source_id, base.n_key, FACT.task_attribute_wh_new_value_key
from #DWH_TABLE_SCHEMA.f_work_item_activity FACT
left join (
select FACT.work_item_key, SRC.issueid, FACT.source_id, FACT.task_attribute_wh_name, SRC.n_key, max(FACT.primary_sequence_id) max_primary_sequence_id
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #DWH_TABLE_SCHEMA.d_work_item D
on SRC.issueid = D.row_id and SRC.sourceinstance = D.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on SRC.n_key = CAL.row_key
left join #DWH_TABLE_SCHEMA.f_work_item_activity FACT
on FACT.work_item_key = D.row_key and FACT.source_id = D.source_id and FACT.task_attribute_wh_name = 'ITERATION'
where FACT.task_attribute_wh_name = 'ITERATION' and FACT.started_on_key <= CAL.week_end_date_key
group by FACT.work_item_key, SRC.issueid, FACT.source_id, FACT.task_attribute_wh_name, SRC.n_key
) base
on FACT.work_item_key = base.work_item_key and FACT.source_id = base.source_id and FACT.task_attribute_wh_name = base.task_attribute_wh_name 
and FACT.primary_sequence_id = base.max_primary_sequence_id and FACT.task_attribute_wh_name = 'ITERATION'
where base.n_key is not null) LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.source_id and SRC.n_key = LKP.n_key
set SRC.work_item_iteration_key = coalesce(LKP.task_attribute_wh_new_value_key, 0);