drop table if exists #STG_TABLE_SCHEMA.f_a_request_item_backlog_smpo_dppc_base;

create table if not exists #STG_TABLE_SCHEMA.f_a_request_item_backlog_smpo_dppc_base (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  source_id bigint(20) NOT NULL DEFAULT 0,
  assignment_group_key bigint(20) DEFAULT 0, 
  assigned_to_key bigint(20) DEFAULT 0, 
  soft_deleted_flag char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  opened_request_items_last_30_days bigint(20) DEFAULT 0, 
  resolved_request_items_last_30_days bigint(20) DEFAULT 0, 
  request_item_backlog_last_30_day bigint(20) DEFAULT 0,
  request_item_current_backlog bigint(20) DEFAULT NULL,
  request_item_current_backlog_age bigint(20) DEFAULT NULL,
  to_delete_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  inserted_on datetime DEFAULT NULL,
  updated_on datetime DEFAULT NULL,
  PRIMARY KEY (sys_id, source_id),
  INDEX first_idx (assignment_group_key, assigned_to_key, source_id) USING BTREE,
  INDEX second_idx (assignment_group_key, assigned_to_key) USING BTREE
);

insert into #STG_TABLE_SCHEMA.f_a_request_item_backlog_smpo_dppc_base
(sys_id, source_id, assignment_group_key, assigned_to_key, soft_deleted_flag, inserted_on, updated_on)
select distinct trim(concat(F.assignment_group_key, '_', F.assigned_to_key)) as sys_id, F.source_id, F.assignment_group_key, F.assigned_to_key, F.soft_deleted_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from #DWH_TABLE_SCHEMA.f_request_item F
where F.soft_deleted_flag <> 'Y';


SET SQL_SAFE_UPDATES = 0;

-- Opened date as canonical date --

update #STG_TABLE_SCHEMA.f_a_request_item_backlog_smpo_dppc_base base
join (
 select F.source_id, F.assignment_group_key, F.assigned_to_key,
    count(case when D.backlog_flag = 'Y' then F.request_item_key else null end) as request_item_current_backlog,
    sum(case when D.backlog_flag = 'Y' then F.age else 0 end) as request_item_current_backlog_age,
	count(case when REQ_ST.dimension_wh_code <> 'CANCELLED' and CAL.lagging_count_of_days > 29 then F.request_item_key else null end) as opened_request_items_last_30_days	
	from #DWH_TABLE_SCHEMA.f_request_item F
	left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
   ON F.opened_on_key = CAL.row_key
left join #DWH_TABLE_SCHEMA.d_request_item D
  on D.row_key = F.request_item_key and D.source_id = F.source_id
  left join #DWH_TABLE_SCHEMA.d_lov_map REQ_ST
on F.state_src_key = REQ_ST.src_key and F.source_id = REQ_ST.source_id
group by F.source_id, F.assignment_group_key, F.assigned_to_key
) opened_date_canonical
on base.assignment_group_key = opened_date_canonical.assignment_group_key and base.assigned_to_key = opened_date_canonical.assigned_to_key and base.source_id = opened_date_canonical.source_id
set base.request_item_current_backlog = opened_date_canonical.request_item_current_backlog,
 base.request_item_current_backlog_age = opened_date_canonical.request_item_current_backlog_age, 
 base.opened_request_items_last_30_days = opened_date_canonical.opened_request_items_last_30_days,
 base.updated_on = current_timestamp;


-- using last closed on date as canonical date to calculate closed req items--
update #STG_TABLE_SCHEMA.f_a_request_item_backlog_smpo_dppc_base base
join (
  select F.source_id, F.assignment_group_key, F.assigned_to_key,
    count(case when REQ_ST.dimension_wh_code <> 'CANCELLED' and CAL.lagging_count_of_days > 29 then F.request_item_key else null end) as resolved_request_items_last_30_days
  from #DWH_TABLE_SCHEMA.f_request_item F
  left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
   ON F.closed_on_key = CAL.row_key
  left join #DWH_TABLE_SCHEMA.d_request_item D
   ON D.row_key = F.request_item_key and D.source_id = F.source_id
  left join #DWH_TABLE_SCHEMA.d_lov_map REQ_ST
on F.state_src_key = REQ_ST.src_key and F.source_id = REQ_ST.source_id
  group by F.source_id, F.assignment_group_key, F.assigned_to_key
) resolved_date_canonical
on base.assignment_group_key = resolved_date_canonical.assignment_group_key and base.assigned_to_key = resolved_date_canonical.assigned_to_key and base.source_id = resolved_date_canonical.source_id
set base.resolved_request_items_last_30_days = resolved_date_canonical.resolved_request_items_last_30_days, base.updated_on = current_timestamp;



update #STG_TABLE_SCHEMA.f_a_request_item_backlog_smpo_dppc_base base
  set base.request_item_backlog_last_30_day = case when base.opened_request_items_last_30_days > base.resolved_request_items_last_30_days
  then (base.opened_request_items_last_30_days - coalesce(base.resolved_request_items_last_30_days, 0)) else 0 end, base.updated_on = current_timestamp;
  
  delete from #STG_TABLE_SCHEMA.f_a_request_item_backlog_smpo_dppc_base where to_delete_flag = 'Y';
