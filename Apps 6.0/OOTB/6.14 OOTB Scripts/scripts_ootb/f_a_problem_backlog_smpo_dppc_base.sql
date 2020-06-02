drop table if exists #STG_TABLE_SCHEMA.f_a_problem_backlog_smpo_dppc_base;

create table if not exists #STG_TABLE_SCHEMA.f_a_problem_backlog_smpo_dppc_base (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  source_id bigint(20) NOT NULL DEFAULT 0,
  assignment_group_key bigint(20) DEFAULT 0, 
  assigned_to_key bigint(20) DEFAULT 0, 
  soft_deleted_flag char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  problem_current_backlog bigint(20) DEFAULT 0, 
  problem_task_current_backlog bigint(20) DEFAULT 0,
  problem_current_backlog_age bigint(20) DEFAULT 0,  
  opened_problem_last_30_days bigint(20) DEFAULT 0, 
  resolved_problem_last_30_days bigint(20) DEFAULT 0, 
  problem_backlog_last_30_day bigint(20) DEFAULT 0,
  problem_tasks_backlog_last_30_day bigint(20) DEFAULT 0,
  opened_problem_tasks_last_30_days bigint(20) DEFAULT 0,
  resolved_problem_tasks_last_30_days bigint(20) DEFAULT 0, 
  to_delete_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  inserted_on datetime DEFAULT NULL,
  updated_on datetime DEFAULT NULL,
  PRIMARY KEY (sys_id, source_id),
  INDEX first_idx (assignment_group_key, assigned_to_key, source_id) USING BTREE,
  INDEX second_idx (assignment_group_key, assigned_to_key) USING BTREE
);

insert into #STG_TABLE_SCHEMA.f_a_problem_backlog_smpo_dppc_base
(sys_id, source_id, assignment_group_key, assigned_to_key, soft_deleted_flag, inserted_on, updated_on)
select distinct trim(concat(F.assignment_group_key, '_', F.assigned_to_key)) as sys_id, F.source_id, F.assignment_group_key, F.assigned_to_key, 
F.soft_deleted_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from #DWH_TABLE_SCHEMA.f_problem F
where F.soft_deleted_flag <> 'Y' 
union 
select distinct trim(concat(F1.assignment_group_key, '_', F1.assigned_to_key)) as sys_id, F1.source_id, F1.assignment_group_key, F1.assigned_to_key, 
F1.soft_deleted_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from #DWH_TABLE_SCHEMA.f_problem_task F1
where F1.soft_deleted_flag <> 'Y' ;

SET SQL_SAFE_UPDATES = 0;


update #STG_TABLE_SCHEMA.f_a_problem_backlog_smpo_dppc_base base
join (
  select F.source_id, F.assignment_group_key, F.assigned_to_key,
    count(case when D.backlog_flag = 'Y' then F.problem_key else null end) as problem_task_current_backlog,
    count(case when INC_ST.dimension_wh_code <> 'CANCELLED' and CAL.lagging_count_of_days > 29 then F.problem_task_key else null end) as opened_problem_tasks_last_30_days
  from #DWH_TABLE_SCHEMA.f_problem_task F
  left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
   ON F.opened_on_key = CAL.row_key
   and F.soft_deleted_flag='N'
  left join #DWH_TABLE_SCHEMA.d_problem_task D
   ON D.row_key = F.problem_task_key and D.source_id = F.source_id
  left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
   on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
  group by F.source_id, F.assignment_group_key, F.assigned_to_key
) opened_date_canonical
on base.assignment_group_key = opened_date_canonical.assignment_group_key and base.assigned_to_key = opened_date_canonical.assigned_to_key 
and base.source_id = opened_date_canonical.source_id
set base.problem_task_current_backlog = opened_date_canonical.problem_task_current_backlog, 
base.opened_problem_tasks_last_30_days = opened_date_canonical.opened_problem_tasks_last_30_days, base.updated_on = current_timestamp;

update  #STG_TABLE_SCHEMA.f_a_problem_backlog_smpo_dppc_base base
join (
  select F.source_id, F.assignment_group_key, F.assigned_to_key,
    count(case when INC_ST.dimension_wh_code <> 'CANCELLED' and CAL.lagging_count_of_days > 29 then F.problem_task_key else null end) as 
	resolved_problem_tasks_last_30_days
  from #DWH_TABLE_SCHEMA.f_problem_task F
  left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
   ON F.closed_on_key = CAL.row_key
   and F.soft_deleted_flag='N'
  left join #DWH_TABLE_SCHEMA.d_problem_task D
   ON D.row_key = F.problem_task_key and D.source_id = F.source_id
  left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
   on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
  group by F.source_id, F.assignment_group_key, F.assigned_to_key
) resolved_date_canonical
on base.assignment_group_key = resolved_date_canonical.assignment_group_key and base.assigned_to_key = resolved_date_canonical.assigned_to_key 
and base.source_id = resolved_date_canonical.source_id
set base.resolved_problem_tasks_last_30_days = resolved_date_canonical.resolved_problem_tasks_last_30_days,
 base.updated_on = current_timestamp;
 
 update #STG_TABLE_SCHEMA.f_a_problem_backlog_smpo_dppc_base base
join (
  select F.source_id, F.assignment_group_key, F.assigned_to_key,
    count(case when D.backlog_flag = 'Y' then F.problem_key else null end) as problem_current_backlog,
	sum(case when D.backlog_flag = 'Y' then F.age else 0 end) as problem_current_backlog_age,
    count(case when INC_ST.dimension_wh_code <> 'CANCELLED' and CAL.lagging_count_of_days > 29 then F.problem_key else null end) as opened_problem_last_30_days
  from #DWH_TABLE_SCHEMA.f_problem F
  left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
   ON F.opened_on_key = CAL.row_key
   and F.soft_deleted_flag='N'
  left join #DWH_TABLE_SCHEMA.d_problem D
   ON D.row_key = F.problem_key and D.source_id = F.source_id
   and D.soft_deleted_flag='N'
  left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
   on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
  group by F.source_id, F.assignment_group_key, F.assigned_to_key
) opened_date_canonical
on base.assignment_group_key = opened_date_canonical.assignment_group_key and base.assigned_to_key = opened_date_canonical.assigned_to_key 
and base.source_id = opened_date_canonical.source_id
set base.problem_current_backlog = opened_date_canonical.problem_current_backlog, 
base.problem_current_backlog_age=opened_date_canonical.problem_current_backlog_age,
base.opened_problem_last_30_days = opened_date_canonical.opened_problem_last_30_days, base.updated_on = current_timestamp;
 

update  #STG_TABLE_SCHEMA.f_a_problem_backlog_smpo_dppc_base base
join (
  select F.source_id, F.assignment_group_key, F.assigned_to_key,
    count(case when INC_ST.dimension_wh_code <> 'CANCELLED' and CAL.lagging_count_of_days > 29 then F.problem_key else null end) as 
	resolved_problem_last_30_days
  from #DWH_TABLE_SCHEMA.f_problem F
  left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
   ON F.closed_on_key = CAL.row_key
   and F.soft_deleted_flag='N'
  left join #DWH_TABLE_SCHEMA.d_problem D
   ON D.row_key = F.problem_key and D.source_id = F.source_id
   and D.soft_deleted_flag='N'
  left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
   on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
  group by F.source_id, F.assignment_group_key, F.assigned_to_key
) resolved_date_canonical
on base.assignment_group_key = resolved_date_canonical.assignment_group_key and base.assigned_to_key = resolved_date_canonical.assigned_to_key 
and base.source_id = resolved_date_canonical.source_id
set base.resolved_problem_last_30_days = resolved_date_canonical.resolved_problem_last_30_days,
 base.updated_on = current_timestamp;
 
 
update #STG_TABLE_SCHEMA.f_a_problem_backlog_smpo_dppc_base base
set base.problem_tasks_backlog_last_30_day = case when base.opened_problem_tasks_last_30_days > base.resolved_problem_tasks_last_30_days then (base.opened_problem_tasks_last_30_days - coalesce(base.resolved_problem_tasks_last_30_days, 0)) else 0 end,
base.updated_on = current_timestamp;


update #STG_TABLE_SCHEMA.f_a_problem_backlog_smpo_dppc_base base
set base.problem_backlog_last_30_day = case when base.opened_problem_last_30_days > base.resolved_problem_last_30_days then
 (base.opened_problem_last_30_days - coalesce(base.resolved_problem_last_30_days, 0)) else 0 end,
base.updated_on = current_timestamp;