drop table if exists #STG_TABLE_SCHEMA.f_a_request_item_smpo_dppc_base;

create table if not exists #STG_TABLE_SCHEMA.f_a_request_item_smpo_dppc_base (
  created_by varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  pending_request_items bigint(20) DEFAULT NULL,
  request_items_met_all_slas bigint(20) DEFAULT NULL,
  secondary1_changed_on datetime DEFAULT NULL,
  changed_on datetime DEFAULT NULL,
  created_to_updated_duration bigint(20) DEFAULT NULL,
  calendar_date date DEFAULT NULL,
  calendar_date_key bigint(20) DEFAULT NULL,
  lagging_count_of_days int(15) DEFAULT 0,
  soft_deleted_flag char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  closed_request_items bigint(20) DEFAULT NULL,
  assignment_group_key bigint(20) DEFAULT NULL,
  opened_request_items bigint(20) DEFAULT NULL,
  assigned_to_key bigint(20) DEFAULT NULL,
  update_count bigint(20) DEFAULT NULL,
  overdue_request_items bigint(20) DEFAULT NULL,
  reprioritize_request_items bigint(20) DEFAULT NULL,
  open_to_close_duration bigint(20) DEFAULT NULL,
  closed_by_key bigint(20) DEFAULT NULL,
  reassigned_request_items bigint(20) DEFAULT NULL,
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  changed_by varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  created_on datetime DEFAULT NULL,
  source_id smallint(6) DEFAULT NULL,
  generic_ci_request_item bigint(20) DEFAULT NULL,
  inserted_on datetime DEFAULT NULL,
  updated_on datetime DEFAULT NULL,
  to_delete_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (sys_id, source_id),
  INDEX first_idx (assignment_group_key, assigned_to_key, calendar_date_key, source_id) USING BTREE,
  INDEX second_idx (assignment_group_key, assigned_to_key, calendar_date_key) USING BTREE
) ;

insert into #STG_TABLE_SCHEMA.f_a_request_item_smpo_dppc_base
(sys_id, source_id, assignment_group_key, assigned_to_key, closed_by_key, calendar_date, calendar_date_key, lagging_count_of_days, soft_deleted_flag, 
inserted_on, updated_on)
select distinct trim(concat(F.assignment_group_key, '_', F.assigned_to_key, '_', CAL.row_key,'_',F.closed_by_key)) as sys_id, F.source_id, 
F.assignment_group_key, F.assigned_to_key, F.closed_by_key, CAL.calendar_date as calendar_date, CAL.row_key as calender_date_key,
CAL.lagging_count_of_days, F.soft_deleted_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from #DWH_TABLE_SCHEMA.f_request_item F
cross join 
(
select distinct CAL.calendar_date as calendar_date, CAL.row_key as row_key,CAL.lagging_count_of_days, CAL.calendar_code
from #DWH_TABLE_SCHEMA.d_calendar_date CAL
where CAL.lagging_count_of_days between 0 and 59
) CAL
where F.soft_deleted_flag <> 'Y';

SET SQL_SAFE_UPDATES = 0;

-- Closed date as canonical date --

update #STG_TABLE_SCHEMA.f_a_request_item_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.closed_on_key, F.closed_by_key,
count(case when REQ_ST.dimension_wh_code in ('CLOSED') then F.request_item_key else null end) as closed_request_items,
sum(F.open_to_close_duration) as open_to_close_duration,
count(case when D.met_sla_flag = 'Y' then F.request_item_key else null end) as request_items_met_all_slas

from #DWH_TABLE_SCHEMA.f_request_item F
left join #DWH_TABLE_SCHEMA.d_request_item D
  on D.row_key = F.request_item_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map REQ_ST
on F.state_src_key = REQ_ST.src_key and F.source_id = REQ_ST.source_id
group by F.assignment_group_key, F.assigned_to_key, F.closed_on_key,F.closed_by_key
) cl_request_items
on base.assignment_group_key = cl_request_items.assignment_group_key and base.assigned_to_key = cl_request_items.assigned_to_key and
cl_request_items.closed_on_key = base.calendar_date_key and base.closed_by_key = cl_request_items.closed_by_key
set base.closed_request_items = cl_request_items.closed_request_items,base.open_to_close_duration=cl_request_items.open_to_close_duration,
base.request_items_met_all_slas=cl_request_items.request_items_met_all_slas,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Opened date as canonical date --

update #STG_TABLE_SCHEMA.f_a_request_item_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.opened_on_key, F.closed_by_key,
count(F.request_item_key) as opened_request_items,
count(case when REQ_ST.dimension_wh_code = 'OPEN' then F.request_item_key else null end) as pending_request_items,
-- count(case when F.reassignment_count > 1 then F.request_item_key else null end) as reassigned_request_items,
-- count(case when (D.priority_de_escalated_flag = 'Y' or D.priority_escalated_flag = 'Y') then F.request_item_key else null end) as reprioritize_request_items,
-- sum(F.update_count) as update_count,
-- sum( F.create_to_last_update_duration ) as created_to_updated_duration,
count(case when mas.generic_ci_flag = 'Y' then F.request_item_key else null end) as generic_ci_request_item

from #DWH_TABLE_SCHEMA.f_request_item F
left join #DWH_TABLE_SCHEMA.d_request_item D
  on D.row_key = F.request_item_key and D.source_id = F.source_id
  left join #DWH_TABLE_SCHEMA.d_lov_map REQ_ST
on F.state_src_key = REQ_ST.src_key and F.source_id = REQ_ST.source_id
left join #DWH_TABLE_SCHEMA.d_master_item mas
 on mas.row_key = F.catalog_item_key and mas.source_id = F.source_id
group by F.assignment_group_key, F.assigned_to_key, F.opened_on_key,F.closed_by_key
) op_request_items
on base.assignment_group_key = op_request_items.assignment_group_key and base.assigned_to_key = op_request_items.assigned_to_key and
op_request_items.opened_on_key = base.calendar_date_key and base.closed_by_key = op_request_items.closed_by_key
set base.opened_request_items = op_request_items.opened_request_items,base.pending_request_items=op_request_items.pending_request_items,
-- base.reassigned_request_items=op_request_items.reassigned_request_items, 
-- base.reprioritize_request_items=op_request_items.reprioritize_request_items, 
-- base.update_count = op_request_items.update_count,
-- base.created_to_updated_duration = op_request_items.created_to_updated_duration,
 base.generic_ci_request_item = op_request_items.generic_ci_request_item,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Due date as canonical date --

update #STG_TABLE_SCHEMA.f_a_request_item_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.due_on_key, F.closed_by_key,
count(F.request_item_key) as overdue_request_items
from #DWH_TABLE_SCHEMA.f_request_item F
left join #DWH_TABLE_SCHEMA.d_request_item D
  on D.row_key = F.request_item_key and D.source_id = F.source_id
  where D.over_due_flag = 'Y'
group by F.assignment_group_key, F.assigned_to_key, F.due_on_key,F.closed_by_key
) due_request_items
on base.assignment_group_key = due_request_items.assignment_group_key and base.assigned_to_key = due_request_items.assigned_to_key and
 base.calendar_date_key=due_request_items.due_on_key  and base.closed_by_key = due_request_items.closed_by_key
set base.overdue_request_items=due_request_items.overdue_request_items,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- last update date as canonical date --

update #STG_TABLE_SCHEMA.f_a_request_item_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.closed_by_key,coalesce(F.last_updated_on_key, 0) as last_updated_on_key, 
sum(F.create_to_last_update_duration) as created_to_updated_duration,
sum(F.update_count) as update_count
from #DWH_TABLE_SCHEMA.f_request_item F
left join #DWH_TABLE_SCHEMA.d_request_item D
  on D.row_key = F.request_item_key and D.source_id = F.source_id
group by F.assignment_group_key, F.assigned_to_key, F.last_updated_on_key,F.closed_by_key
) updated_request_items
on updated_request_items.assigned_to_key= base.assigned_to_key and updated_request_items.assignment_group_key = base.assignment_group_key
and base.closed_by_key = updated_request_items.closed_by_key and base.calendar_date_key = updated_request_items.last_updated_on_key
set base.update_count = updated_request_items.update_count,  base.created_to_updated_duration = updated_request_items.created_to_updated_duration,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- reprioritization date as canonical date --

update #STG_TABLE_SCHEMA.f_a_request_item_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.closed_by_key,coalesce(F.last_reprioritized_on_key, 0) as last_reprioritized_on_key ,
count(case when (D.priority_de_escalated_flag = 'Y' or D.priority_escalated_flag = 'Y') then F.request_item_key else null end) as reprioritize_request_items
from #DWH_TABLE_SCHEMA.f_request_item F
left join #DWH_TABLE_SCHEMA.d_request_item D
  on D.row_key = F.request_item_key and D.source_id = F.source_id
group by F.assignment_group_key, F.assigned_to_key, F.last_reprioritized_on_key,F.closed_by_key
) updated_request_items
on updated_request_items.assigned_to_key= base.assigned_to_key and updated_request_items.assignment_group_key = base.assignment_group_key
and base.closed_by_key = updated_request_items.closed_by_key and base.calendar_date_key = updated_request_items.last_reprioritized_on_key
set base.reprioritize_request_items = updated_request_items.reprioritize_request_items,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';


-- reassigned date as canonical date --

update #STG_TABLE_SCHEMA.f_a_request_item_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.closed_by_key,coalesce(F.last_reassigned_on_key, 0) as last_reassigned_on_key ,
count(F.request_item_key) as reassigned_request_items
from #DWH_TABLE_SCHEMA.f_request_item F
left join #DWH_TABLE_SCHEMA.d_request_item D
  on D.row_key = F.request_item_key and D.source_id = F.source_id
  where F.reassignment_count > 1
group by F.assignment_group_key, F.assigned_to_key, F.last_reassigned_on_key,F.closed_by_key
) updated_request_items
on updated_request_items.assigned_to_key= base.assigned_to_key and updated_request_items.assignment_group_key = base.assignment_group_key
and base.closed_by_key = updated_request_items.closed_by_key and base.calendar_date_key = updated_request_items.last_reassigned_on_key
set base.reassigned_request_items = updated_request_items.reassigned_request_items,
base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';




delete from #STG_TABLE_SCHEMA.f_a_request_item_smpo_dppc_base where to_delete_flag = 'Y';

