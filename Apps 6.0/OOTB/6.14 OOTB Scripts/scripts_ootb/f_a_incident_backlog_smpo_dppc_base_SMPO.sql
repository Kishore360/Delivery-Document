drop table if exists #STG_TABLE_SCHEMA.f_a_incident_backlog_smpo_dppc_base;

create table if not exists #STG_TABLE_SCHEMA.f_a_incident_backlog_smpo_dppc_base (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  source_id bigint(20) NOT NULL DEFAULT 0,
  assignment_group_key bigint(20) DEFAULT 0, 
  assigned_to_key bigint(20) DEFAULT 0, 
  soft_deleted_flag char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  incident_current_backlog bigint(20) DEFAULT 0, 
  incident_current_backlog_age bigint(20) DEFAULT 0, 
  opened_incidents_last_30_days bigint(20) DEFAULT 0, 
  resolved_incidents_last_30_days bigint(20) DEFAULT 0, 
  incident_backlog_last_30_day bigint(20) DEFAULT 0,
  to_delete_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  inserted_on datetime DEFAULT NULL,
  updated_on datetime DEFAULT NULL,
  PRIMARY KEY (sys_id, source_id),
  INDEX first_idx (assignment_group_key, assigned_to_key, source_id) USING BTREE,
  INDEX second_idx (assignment_group_key, assigned_to_key) USING BTREE
);

insert into #STG_TABLE_SCHEMA.f_a_incident_backlog_smpo_dppc_base
(sys_id, source_id, assignment_group_key, assigned_to_key, soft_deleted_flag, inserted_on, updated_on)
select distinct trim(concat(F.assignment_group_key, '_', F.assigned_to_key)) as sys_id, F.source_id, F.assignment_group_key, F.assigned_to_key, F.soft_deleted_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from #DWH_TABLE_SCHEMA.f_incident F
where F.soft_deleted_flag <> 'Y';

update #STG_TABLE_SCHEMA.f_a_incident_backlog_smpo_dppc_base base
join (
  select F.source_id, F.assignment_group_key, F.assigned_to_key,
    count(case when D.backlog_flag = 'Y' then F.incident_key else null end) as incident_current_backlog,
    sum(case when D.backlog_flag = 'Y' then F.age else 0 end) as incident_current_backlog_age,
    -- count(case when INC_ST.dimension_wh_code <> 'CANCELLED' and CAL.lagging_count_of_days > 29 then F.incident_key else null end) as opened_incidents_last_30_days
	count(case when INC_ST.dimension_wh_code <> 'CANCELED' and CAL.lagging_count_of_days > 29 then F.incident_key else null end) as opened_incidents_last_30_days
  from #DWH_TABLE_SCHEMA.f_incident F
  left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
   ON F.opened_on_key = CAL.row_key
  left join #DWH_TABLE_SCHEMA.d_incident D
   ON D.row_key = F.incident_key and D.source_id = F.source_id
  left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
   on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
  where F.soft_deleted_flag <> 'Y' 
  group by F.source_id, F.assignment_group_key, F.assigned_to_key
) opened_date_canonical
on base.assignment_group_key = opened_date_canonical.assignment_group_key and base.assigned_to_key = opened_date_canonical.assigned_to_key and base.source_id = opened_date_canonical.source_id
set base.incident_current_backlog = opened_date_canonical.incident_current_backlog, base.incident_current_backlog_age = opened_date_canonical.incident_current_backlog_age, 
  base.opened_incidents_last_30_days = opened_date_canonical.opened_incidents_last_30_days, base.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.f_a_incident_backlog_smpo_dppc_base base
join (
  select F.source_id, F.assignment_group_key, F.assigned_to_key,
   -- count(case when INC_ST.dimension_wh_code <> 'CANCELLED' and CAL.lagging_count_of_days > 29 then F.incident_key else null end) as resolved_incidents_last_30_days
   count(case when INC_ST.dimension_wh_code <> 'CANCELED' and CAL.lagging_count_of_days > 29 then F.incident_key else null end) as resolved_incidents_last_30_days
  from #DWH_TABLE_SCHEMA.f_incident F
  left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
   ON F.last_resolved_on_key = CAL.row_key
  left join #DWH_TABLE_SCHEMA.d_incident D
   ON D.row_key = F.incident_key and D.source_id = F.source_id
  left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
   on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
  where F.soft_deleted_flag <> 'Y' 
  group by F.source_id, F.assignment_group_key, F.assigned_to_key
) resolved_date_canonical
on base.assignment_group_key = resolved_date_canonical.assignment_group_key and base.assigned_to_key = resolved_date_canonical.assigned_to_key and base.source_id = resolved_date_canonical.source_id
set base.resolved_incidents_last_30_days = resolved_date_canonical.resolved_incidents_last_30_days, base.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.f_a_incident_backlog_smpo_dppc_base base
  set base.incident_backlog_last_30_day = case when base.opened_incidents_last_30_days > base.resolved_incidents_last_30_days then (base.opened_incidents_last_30_days - coalesce(base.resolved_incidents_last_30_days, 0)) else 0 end, base.updated_on = current_timestamp;