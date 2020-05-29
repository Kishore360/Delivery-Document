drop table if exists    #STG_TABLE_SCHEMA.f_a_problem_smpo_dppc_base;

create table if not exists   #STG_TABLE_SCHEMA.f_a_problem_smpo_dppc_base (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  source_id bigint(20) NOT NULL DEFAULT 0,
  assignment_group_key bigint(20) DEFAULT 0, 
  assigned_to_key bigint(20) DEFAULT 0, 
  calendar_date date DEFAULT NULL,
  calendar_date_key int(15) DEFAULT 0,
  lagging_count_of_days int(15) DEFAULT 0,
  soft_deleted_flag char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  opened_problems bigint(20) DEFAULT 0, 
  closed_problem_tasks bigint(20) DEFAULT 0,
  reprioritized_problems bigint(20) DEFAULT 0, 
  reopened_problems bigint(20) DEFAULT 0, 
  reocuurrences bigint(20) DEFAULT 0, 
  age bigint(20) DEFAULT 0, 
  caused_by_change_problems bigint(20) DEFAULT 0, 
  opened_problem_tasks bigint(20) DEFAULT 0, 
  problem_task_met_all_slas bigint(20) DEFAULT 0, 
  overdue_problem_tasks bigint(20) DEFAULT 0,
  to_delete_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  inserted_on datetime DEFAULT NULL,
  updated_on datetime DEFAULT NULL,
  PRIMARY KEY (sys_id, source_id),
  INDEX first_idx (assignment_group_key, assigned_to_key, calendar_date_key, source_id) USING BTREE,
  INDEX second_idx (assignment_group_key, assigned_to_key, calendar_date_key) USING BTREE
);

insert into   #STG_TABLE_SCHEMA.f_a_problem_smpo_dppc_base
(sys_id, source_id, assignment_group_key, assigned_to_key, calendar_date, calendar_date_key, lagging_count_of_days, soft_deleted_flag, inserted_on, updated_on)
select distinct (concat(SRC.assignment_group_key,'_',SRC.assigned_to_key,'_',CAL.row_key))as sys_id,SRC.source_id,SRC.assignment_group_key,
SRC.assigned_to_key, CAL.calendar_date as calendar_date, CAL.row_key as calender_date_key,
CAL.lagging_count_of_days, SRC.soft_deleted_flag, current_timestamp as inserted_on, current_timestamp as updated_on 
from   #DWH_TABLE_SCHEMA.f_problem SRC
cross join 
(
select distinct CAL.calendar_date as calendar_date, CAL.row_key as row_key,CAL.lagging_count_of_days, CAL.calendar_code
from  #DWH_TABLE_SCHEMA.d_calendar_date CAL
-- where CAL.lagging_count_of_days between CAL_CURR.lagging_count_of_days and CAL_CURR.lagging_count_of_days + 59 
where CAL.lagging_count_of_days between 0 and 59
) CAL
where COALESCE(SRC.soft_deleted_flag) <> 'Y'

union
select distinct (concat(SRC1.assignment_group_key,'_',SRC1.assigned_to_key,'_',CAL.row_key))as sys_id,SRC1.source_id,SRC1.assignment_group_key,
SRC1.assigned_to_key, CAL.calendar_date as calendar_date, CAL.row_key as calender_date_key,
CAL.lagging_count_of_days, SRC1.soft_deleted_flag, current_timestamp as inserted_on, current_timestamp as updated_on 
from   #DWH_TABLE_SCHEMA.f_problem_task SRC1

cross join 
(
select distinct CAL.calendar_date as calendar_date, CAL.row_key as row_key,CAL.lagging_count_of_days, CAL.calendar_code
from  #DWH_TABLE_SCHEMA.d_calendar_date CAL
-- where CAL.lagging_count_of_days between CAL_CURR.lagging_count_of_days and CAL_CURR.lagging_count_of_days + 59 
where CAL.lagging_count_of_days between 0 and 59
) CAL
where COALESCE(SRC1.soft_deleted_flag) <> 'Y';

SET SQL_SAFE_UPDATES = 0;

-- measures based on the canonical date :problem_opened_on_key
update   #STG_TABLE_SCHEMA.f_a_problem_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.opened_on_key, 
  count(distinct F.problem_key) as opened_problems,
  -- case when (D.priority_de_escalated_flag = 'Y' or D.priority_escalated_flag = 'Y') and PROB_ST.dimension_wh_code <> 'CANCELLED' 
  -- then count(distinct F.problem_key) else null end as reprioritized_problems,
  -- case when D.reopened_flag = 'Y'  then   count(distinct F.problem_key) else null end as reopened_problems,
  case when F.reoccurance_count >0 then sum(distinct F.reoccurance_count) else 0 end  as reocuurrences,
  sum(distinct F.age) as age,
  count(distinct FCC.problem_key) as caused_by_change_problems
from  #DWH_TABLE_SCHEMA.f_problem F
left join  #DWH_TABLE_SCHEMA.d_problem D
  on D.row_key = F.problem_key and D.source_id = F.source_id
left join   #DWH_TABLE_SCHEMA.f_caused_by_change FCC
  on FCC.problem_key = F.problem_key and FCC.source_id = F.source_id
left join  #DWH_TABLE_SCHEMA.d_lov_map PROB_ST
on F.state_src_key = PROB_ST.src_key and F.source_id = PROB_ST.source_id
group by F.assignment_group_key, F.assigned_to_key, F.opened_on_key
) opened_problem_cnt
on base.assignment_group_key = opened_problem_cnt.assignment_group_key 
and base.assigned_to_key = opened_problem_cnt.assigned_to_key 
and opened_problem_cnt.opened_on_key = base.calendar_date_key
set base.opened_problems = opened_problem_cnt.opened_problems, 
-- base.reprioritized_problems=opened_problem_cnt.reprioritized_problems,
-- base.reopened_probelms=opened_problem_cnt.reopened_problems,
base.reocuurrences=opened_problem_cnt.reocuurrences,
base.age=opened_problem_cnt.age,
base.caused_by_change_problems=opened_problem_cnt.caused_by_change_problems,
base.to_delete_flag = 'N';

-- measures based on the canonical date :problem_last_reopened_on_key

update   #STG_TABLE_SCHEMA.f_a_problem_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.last_reopened_on_key, 
  case when D.reopened_flag = 'Y'  then   count(distinct F.problem_key) else null end as reopened_problems
from  #DWH_TABLE_SCHEMA.f_problem F
left join  #DWH_TABLE_SCHEMA.d_problem D
  on D.row_key = F.problem_key and D.source_id = F.source_id
left join  #DWH_TABLE_SCHEMA.d_lov_map PROB_ST
on F.state_src_key = PROB_ST.src_key and F.source_id = PROB_ST.source_id
group by F.assignment_group_key, F.assigned_to_key, F.last_reopened_on_key
) opened_problem_cnt
on base.assignment_group_key = opened_problem_cnt.assignment_group_key 
and base.assigned_to_key = opened_problem_cnt.assigned_to_key 
and opened_problem_cnt.last_reopened_on_key = base.calendar_date_key
set base.reopened_problems=opened_problem_cnt.reopened_problems,
base.to_delete_flag = 'N';


-- measures based on the canonical date :problem_last_reprioritized_on_key

update   #STG_TABLE_SCHEMA.f_a_problem_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.last_reprioritized_on_key, 
case when (D.priority_de_escalated_flag = 'Y' or D.priority_escalated_flag = 'Y') 
then count(distinct F.problem_key) else null end as reprioritized_problems
from  #DWH_TABLE_SCHEMA.f_problem F
left join  #DWH_TABLE_SCHEMA.d_problem D
  on D.row_key = F.problem_key and D.source_id = F.source_id
  and D.soft_deleted_flag='N' and F.soft_deleted_flag='N'
group by F.assignment_group_key, F.assigned_to_key, F.last_reprioritized_on_key
) opened_problem_cnt
on base.assignment_group_key = opened_problem_cnt.assignment_group_key 
and base.assigned_to_key = opened_problem_cnt.assigned_to_key 
-- and (D.priority_de_escalated_flag = 'Y' or D.priority_escalated_flag = 'Y')
and opened_problem_cnt.last_reprioritized_on_key = base.calendar_date_key
set base.reprioritized_problems=opened_problem_cnt.reprioritized_problems,
base.to_delete_flag = 'N';



-- measures based on the canonical date :problem_task_opened_on_key
update   #STG_TABLE_SCHEMA.f_a_problem_smpo_dppc_base base
join (
select PROB_TSK.assignment_group_key, PROB_TSK.assigned_to_key, PROB_TSK.opened_on_key, 
  count(PROB_TSK.problem_task_key) as opened_problem_tasks
 -- count(case when D_PROB_TSK.met_sla_flag = 'Y' and PROB_ST.dimension_wh_code <> 'CANCELLED' then PROB_TSK.problem_task_key else null end) 
 -- as problem_task_met_all_slas
from   #DWH_TABLE_SCHEMA.f_problem_task PROB_TSK
left join  #DWH_TABLE_SCHEMA.d_problem_task D_PROB_TSK
  on D_PROB_TSK.row_key = PROB_TSK.problem_task_key and D_PROB_TSK.source_id = PROB_TSK.source_id
left join  #DWH_TABLE_SCHEMA.d_lov_map PROB_ST
on PROB_TSK.state_src_key = PROB_ST.src_key and PROB_TSK.source_id = PROB_ST.source_id
group by PROB_TSK.assignment_group_key, PROB_TSK.assigned_to_key, PROB_TSK.opened_on_key
) opened_problem_tasks_cnt
on base.assignment_group_key = opened_problem_tasks_cnt.assignment_group_key and base.assigned_to_key = opened_problem_tasks_cnt.assigned_to_key and 
opened_problem_tasks_cnt.opened_on_key = base.calendar_date_key
set base.opened_problem_tasks = opened_problem_tasks_cnt.opened_problem_tasks,
-- base.problem_task_met_all_slas=opened_problem_tasks_cnt.problem_task_met_all_slas,
base.to_delete_flag = 'N';


-- measures based on the canonical date :problem_task_closed_on_key
update   #STG_TABLE_SCHEMA.f_a_problem_smpo_dppc_base base
join (
select PROB_TSK.assignment_group_key, PROB_TSK.assigned_to_key, PROB_TSK.closed_on_key,
count(case when D_PROB_TSK.met_sla_flag = 'Y'  then PROB_TSK.problem_task_key else null end) as problem_task_met_all_slas,
count(distinct PROB_TSK.problem_task_key) as closed_problem_tasks
from   #DWH_TABLE_SCHEMA.f_problem_task PROB_TSK
left join  #DWH_TABLE_SCHEMA.d_problem_task D_PROB_TSK
  on D_PROB_TSK.row_key = PROB_TSK.problem_task_key and D_PROB_TSK.source_id = PROB_TSK.source_id
left join  #DWH_TABLE_SCHEMA.d_lov_map PROB_ST
on PROB_TSK.state_src_key = PROB_ST.src_key and PROB_TSK.source_id = PROB_ST.source_id
group by PROB_TSK.assignment_group_key, PROB_TSK.assigned_to_key, PROB_TSK.closed_on_key
) opened_problem_tasks_cnt
on base.assignment_group_key = opened_problem_tasks_cnt.assignment_group_key and base.assigned_to_key = opened_problem_tasks_cnt.assigned_to_key and 
opened_problem_tasks_cnt.closed_on_key = base.calendar_date_key
set base.problem_task_met_all_slas=opened_problem_tasks_cnt.problem_task_met_all_slas,
base.closed_problem_tasks=opened_problem_tasks_cnt.closed_problem_tasks,
base.to_delete_flag = 'N';



-- measures based on the canonical date :problem_task_due_on_key
update   #STG_TABLE_SCHEMA.f_a_problem_smpo_dppc_base base
join (
select PROB_TSK.assignment_group_key, PROB_TSK.assigned_to_key, PROB_TSK.due_on_key,
count(case when (D_PROB_TSK.over_due_flag = 'Y' and   (PROB_TSK.due_on_key is not null or PROB_TSK.due_on_key <> 0)) then PROB_TSK.problem_task_key else null end) as overdue_problem_tasks
from  #DWH_TABLE_SCHEMA.f_problem_task PROB_TSK
left join #DWH_TABLE_SCHEMA.d_problem_task D_PROB_TSK
  on D_PROB_TSK.row_key = PROB_TSK.problem_task_key and D_PROB_TSK.source_id = PROB_TSK.source_id
  AND D_PROB_TSK.OVER_DUE_FLAG='Y'
left join #DWH_TABLE_SCHEMA.d_lov_map PROB_ST
on PROB_TSK.state_src_key = PROB_ST.src_key and PROB_TSK.source_id = PROB_ST.source_id
group by PROB_TSK.assignment_group_key, PROB_TSK.assigned_to_key, PROB_TSK.due_on_key
having count(case when (D_PROB_TSK.over_due_flag = 'Y') then PROB_TSK.problem_task_key else null end) <> 0
) opened_problem_tasks_cnt
on base.assignment_group_key = opened_problem_tasks_cnt.assignment_group_key and base.assigned_to_key = opened_problem_tasks_cnt.assigned_to_key and 
opened_problem_tasks_cnt.due_on_key = base.calendar_date_key
set base.overdue_problem_tasks=opened_problem_tasks_cnt.overdue_problem_tasks,
base.to_delete_flag = 'N';



 delete from   #STG_TABLE_SCHEMA.f_a_problem_smpo_dppc_base where to_delete_flag = 'Y';

