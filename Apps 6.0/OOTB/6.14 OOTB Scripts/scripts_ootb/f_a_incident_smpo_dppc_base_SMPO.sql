drop table if exists #STG_TABLE_SCHEMA.f_a_incident_smpo_dppc_base;

create table if not exists #STG_TABLE_SCHEMA.f_a_incident_smpo_dppc_base (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  source_id bigint(20) NOT NULL DEFAULT 0,
  assignment_group_key bigint(20) DEFAULT 0, 
  assigned_to_key bigint(20) DEFAULT 0, 
  calendar_date date DEFAULT NULL,
  calendar_date_key int(15) DEFAULT 0,
  lagging_count_of_days int(15) DEFAULT 0,
  soft_deleted_flag char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  create_to_last_update_duration bigint(20) DEFAULT 0, 
  generic_ci_incidents bigint(20) DEFAULT 0, 
  incidents_met_all_slas bigint(20) DEFAULT 0, 
  major_incidents bigint(20) DEFAULT 0, 
  minor_incidents bigint(20) DEFAULT 0, 
  major_incidents_met_all_slas bigint(20) DEFAULT 0, 
  minor_incidents_met_all_slas bigint(20) DEFAULT 0, 
  open_to_resolve_duration bigint(20) DEFAULT 0, 
  opened_incidents bigint(20) DEFAULT 0, 
  pending_incidents bigint(20) DEFAULT 0, 
  reopened_incidents bigint(20) DEFAULT 0,
  reprioritized_incidents bigint(20) DEFAULT 0,
  resolved_incidents bigint(20) DEFAULT 0,
  update_count bigint(20) DEFAULT 0,
  to_delete_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  inserted_on datetime DEFAULT NULL,
  updated_on datetime DEFAULT NULL,
  PRIMARY KEY (sys_id, source_id),
  INDEX first_idx (assignment_group_key, assigned_to_key, calendar_date_key, source_id) USING BTREE,
  INDEX second_idx (assignment_group_key, assigned_to_key, calendar_date_key) USING BTREE
);

insert into #STG_TABLE_SCHEMA.f_a_incident_smpo_dppc_base
(sys_id, source_id, assignment_group_key, assigned_to_key, calendar_date, calendar_date_key, lagging_count_of_days, soft_deleted_flag, inserted_on, updated_on)
select distinct trim(concat(F.assignment_group_key, '_', F.assigned_to_key, '_', CAL.row_key)) as sys_id, F.source_id, F.assignment_group_key, F.assigned_to_key, CAL.calendar_date as calendar_date, CAL.row_key as calender_date_key,
CAL.lagging_count_of_days, F.soft_deleted_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from #DWH_TABLE_SCHEMA.f_incident F
cross join 
(
select distinct CAL.calendar_date as calendar_date, CAL.row_key as row_key,CAL.lagging_count_of_days, CAL.calendar_code
from #DWH_TABLE_SCHEMA.d_calendar_date CAL
-- where CAL.lagging_count_of_days between CAL_CURR.lagging_count_of_days and CAL_CURR.lagging_count_of_days + 59 
where CAL.lagging_count_of_days between 0 and 59
) CAL
where F.soft_deleted_flag <> 'Y';

SET SQL_SAFE_UPDATES = 0;

-- Opened date as canonical date --

update #STG_TABLE_SCHEMA.f_a_incident_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.opened_on_key, 
  count(F.incident_key) as opened_incidents,
  count(case when INC_ST.dimension_wh_code = 'OPEN' then F.incident_key else null end) as pending_incidents,
  count(case when CI.generic_ci_flag = 'Y' then F.incident_key else null end) as generic_ci_incidents

from #DWH_TABLE_SCHEMA.f_incident F
left join #DWH_TABLE_SCHEMA.d_incident D
  on D.row_key = F.incident_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI
  on F.configuration_item_key = CI.row_key and F.source_id = CI.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
where F.soft_deleted_flag <> 'Y'
group by F.assignment_group_key, F.assigned_to_key, F.opened_on_key
) opened_incidents
on base.assignment_group_key = opened_incidents.assignment_group_key and base.assigned_to_key = opened_incidents.assigned_to_key and opened_incidents.opened_on_key = base.calendar_date_key
set base.opened_incidents = opened_incidents.opened_incidents, base.pending_incidents = opened_incidents.pending_incidents, 
base.generic_ci_incidents = opened_incidents.generic_ci_incidents, updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Resolved date as canonical date --

update #STG_TABLE_SCHEMA.f_a_incident_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, coalesce(F.last_resolved_on_key, 0) as last_resolved_on_key, 
  sum(case when INC_ST.dimension_wh_code in ('RESOLVED', 'CLOSED') then F.open_to_resolve_duration else 0 end) as open_to_resolve_duration,
  count(case when INC_ST.dimension_wh_code in ('RESOLVED', 'CLOSED') then F.incident_key else null end) as resolved_incidents

from #DWH_TABLE_SCHEMA.f_incident F
left join #DWH_TABLE_SCHEMA.d_incident D
  on D.row_key = F.incident_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
where F.soft_deleted_flag <> 'Y'
group by F.assignment_group_key, F.assigned_to_key, F.last_resolved_on_key
) resolved_incidents
on base.assignment_group_key = resolved_incidents.assignment_group_key and base.assigned_to_key = resolved_incidents.assigned_to_key and resolved_incidents.last_resolved_on_key = base.calendar_date_key
set base.resolved_incidents = resolved_incidents.resolved_incidents, base.open_to_resolve_duration = resolved_incidents.open_to_resolve_duration, updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Closed date as canonical date --
 
update #STG_TABLE_SCHEMA.f_a_incident_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, coalesce(F.closed_on_key, 0) as closed_on_key, 

  count(case when D.met_sla_flag = 'Y' and INC_ST.dimension_wh_code in ('CLOSED') then F.incident_key else null end) as incidents_met_all_slas,
  count(case when D.major_incident_numerify_flag = 'Y' and INC_ST.dimension_wh_code in ('CLOSED') then F.incident_key else null end) as major_incidents,
  count(case when D.minor_incident_numerify_flag = 'Y' and INC_ST.dimension_wh_code in ('CLOSED') then F.incident_key else null end) as minor_incidents,
  count(case when D.met_sla_flag = 'Y' and D.major_incident_numerify_flag = 'Y' and INC_ST.dimension_wh_code in ('CLOSED') then F.incident_key else null end) as major_incidents_met_all_slas,
  count(case when D.met_sla_flag = 'Y' and D.minor_incident_numerify_flag = 'Y' and INC_ST.dimension_wh_code in ('CLOSED') then F.incident_key else null end) as minor_incidents_met_all_slas

from #DWH_TABLE_SCHEMA.f_incident F
left join #DWH_TABLE_SCHEMA.d_incident D
  on D.row_key = F.incident_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
where F.soft_deleted_flag <> 'Y'
group by F.assignment_group_key, F.assigned_to_key, F.closed_on_key
) closed_incidents
on base.assignment_group_key = closed_incidents.assignment_group_key and base.assigned_to_key = closed_incidents.assigned_to_key and closed_incidents.closed_on_key = base.calendar_date_key
set base.major_incidents_met_all_slas = closed_incidents.major_incidents_met_all_slas, base.minor_incidents_met_all_slas = closed_incidents.minor_incidents_met_all_slas, base.major_incidents = closed_incidents.major_incidents, base.minor_incidents = closed_incidents.minor_incidents, base.incidents_met_all_slas = closed_incidents.incidents_met_all_slas, base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- last update date as canonical date --
 
update #STG_TABLE_SCHEMA.f_a_incident_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, coalesce(F.last_updated_on_key, 0) as last_updated_on_key, 

  sum(case when INC_ST.dimension_wh_code <> 'CANCELED' then F.create_to_last_update_duration else 0 end) as create_to_last_update_duration,
  sum(case when INC_ST.dimension_wh_code <> 'CANCELED' then F.update_count else 0 end) as update_count


from #DWH_TABLE_SCHEMA.f_incident F
left join #DWH_TABLE_SCHEMA.d_incident D
  on D.row_key = F.incident_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
where F.soft_deleted_flag <> 'Y' and INC_ST.dimension_wh_code <> 'CANCELED'
group by F.assignment_group_key, F.assigned_to_key, F.last_updated_on_key
) updated_incidents
on base.assignment_group_key = updated_incidents.assignment_group_key and base.assigned_to_key = updated_incidents.assigned_to_key and updated_incidents.last_updated_on_key = base.calendar_date_key
set base.create_to_last_update_duration = updated_incidents.create_to_last_update_duration, base.update_count = updated_incidents.update_count, base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- reprioritization date as canonical date --
 
update #STG_TABLE_SCHEMA.f_a_incident_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, coalesce(F.last_reprioritized_on_key, 0) as last_reprioritized_on_key, 

  count(case when (D.priority_de_escalated_flag = 'Y' or D.priority_escalated_flag = 'Y') and INC_ST.dimension_wh_code <> 'CANCELED' then F.incident_key else null end) as reprioritized_incidents

from #DWH_TABLE_SCHEMA.f_incident F
left join #DWH_TABLE_SCHEMA.d_incident D
  on D.row_key = F.incident_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
where F.soft_deleted_flag <> 'Y' and (D.priority_de_escalated_flag = 'Y' or D.priority_escalated_flag = 'Y')
group by F.assignment_group_key, F.assigned_to_key, F.last_reprioritized_on_key
) reprioritized_incidents
on base.assignment_group_key = reprioritized_incidents.assignment_group_key and base.assigned_to_key = reprioritized_incidents.assigned_to_key and reprioritized_incidents.last_reprioritized_on_key = base.calendar_date_key
set base.reprioritized_incidents = reprioritized_incidents.reprioritized_incidents, base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- reopen date as canonical date --
 
update #STG_TABLE_SCHEMA.f_a_incident_smpo_dppc_base base
join (
select F.assignment_group_key, F.assigned_to_key, coalesce(F.last_reopened_on_key, 0) as last_reopened_on_key, 

  count(case when D.reopened_flag = 'Y' and INC_ST.dimension_wh_code <> 'CANCELED' then F.incident_key else null end) as reopened_incidents

from #DWH_TABLE_SCHEMA.f_incident F
left join #DWH_TABLE_SCHEMA.d_incident D
  on D.row_key = F.incident_key and D.source_id = F.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map INC_ST
on F.state_src_key = INC_ST.src_key and F.source_id = INC_ST.source_id
where F.soft_deleted_flag <> 'Y' and D.reopened_flag = 'Y' and INC_ST.dimension_wh_code <> 'CANCELED'
group by F.assignment_group_key, F.assigned_to_key, F.last_reopened_on_key
) reopened_incidents
on base.assignment_group_key = reopened_incidents.assignment_group_key and base.assigned_to_key = reopened_incidents.assigned_to_key and reopened_incidents.last_reopened_on_key = base.calendar_date_key
set base.reopened_incidents = reopened_incidents.reopened_incidents, base.updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

delete from #STG_TABLE_SCHEMA.f_a_incident_smpo_dppc_base where to_delete_flag = 'Y';