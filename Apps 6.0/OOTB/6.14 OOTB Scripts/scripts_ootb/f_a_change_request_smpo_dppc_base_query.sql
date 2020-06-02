use #STG_TABLE_SCHEMA;
drop table if exists #STG_TABLE_SCHEMA.f_a_change_smpo_dppc_final_base;

create table if not exists #STG_TABLE_SCHEMA.f_a_change_smpo_dppc_final_base (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  source_id bigint(20) NOT NULL DEFAULT 0,
  assignment_group_key bigint(20) DEFAULT 0, 
  assigned_to_key bigint(20) DEFAULT 0, 
  calendar_date date DEFAULT NULL,
  calendar_date_key int(15) DEFAULT 0,
  lagging_count_of_days int(15) DEFAULT 0,
  soft_deleted_flag char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  caused_by_change_outages	bigint(20)	DEFAULT 0, 
  closed_change_failure_requests	bigint(20)	DEFAULT 0, 
  closed_change_requests	bigint(20)	DEFAULT 0, 
  emergency_change_requests	bigint(20)	DEFAULT 0, 
  high_risk_change_requests	bigint(20)	DEFAULT 0, 
  lead_time	bigint(20)	DEFAULT 0, 
  normal_change_requests	bigint(20)	DEFAULT 0,
  last_normal_to_emergency_changed_change_requests bigint(20)	DEFAULT 0,  
  opened_change_failure_requests	bigint(20)	DEFAULT 0, 
  opened_change_requests	bigint(20)	DEFAULT 0, 
  overdue_change_requests	bigint(20)	DEFAULT 0, 
  planned_caused_by_change_outages bigint(20)	DEFAULT 0, 
  caused_by_change_requests_planned_outages bigint(20)	DEFAULT 0,
  rejected_change_requests	bigint(20)	DEFAULT 0, 
  rollback_change_requests	bigint(20)	DEFAULT 0, 
  successful_change_failure_requests	bigint(20)	DEFAULT 0, 
  inserted_on datetime DEFAULT NULL,
  updated_on datetime DEFAULT NULL,
  to_delete_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (sys_id, source_id),
  INDEX first_idx (assignment_group_key, assigned_to_key, calendar_date_key, source_id) USING BTREE,
  INDEX second_idx (assignment_group_key, assigned_to_key, calendar_date_key) USING BTREE
);

insert into #STG_TABLE_SCHEMA.f_a_change_smpo_dppc_final_base
(sys_id, source_id, assignment_group_key, assigned_to_key, calendar_date, calendar_date_key, lagging_count_of_days, soft_deleted_flag, inserted_on, updated_on)

select distinct trim(concat(F.assignment_group_key, '_', F.assigned_to_key, '_', CAL.row_key)) as sys_id, F.source_id, F.assignment_group_key, F.assigned_to_key, CAL.calendar_date as calendar_date, CAL.row_key as calender_date_key,CAL.lagging_count_of_days, F.soft_deleted_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from #DWH_TABLE_SCHEMA.f_change_request F
cross join 
(
select distinct CAL.calendar_date as calendar_date, CAL.row_key as row_key,CAL.lagging_count_of_days, CAL.calendar_code
from #DWH_TABLE_SCHEMA.d_calendar_date CAL
where CAL.lagging_count_of_days between 0 and 59
) CAL
where F.soft_deleted_flag <> 'Y';

SET SQL_SAFE_UPDATES = 0;

-- Opened date as canonical date --

update #STG_TABLE_SCHEMA.f_a_change_smpo_dppc_final_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.opened_on_key, 
count(case when CR_TYPE.dimension_wh_code='EMERGENCY' and CR_ST.dimension_wh_code not in ('CANCELED') then F.change_request_key else null end) as emergency_change_requests,
count(case when DF.failure_probability_1>0.5 then F.change_request_key else null end) as high_risk_change_requests,
count(case when (CR_TYPE.dimension_wh_code='NORMAL' and CR_ST.dimension_wh_code not in ('CANCELED')) then F.change_request_key else null end) as normal_change_requests,
count(case when CR_ST.dimension_wh_code='CLOSED' then F.change_request_key else null end) as opened_change_failure_requests_1,
count(DF.change_request_key) as opened_change_failure_requests,
count(F.change_request_key) as opened_change_requests_count,
count(case when (CR_APPR.dimension_wh_code='REJECTED' or CR_ST.dimension_wh_code='CANCELED') then F.change_request_key else null end) as rejected_change_requests,
sum(case when (CR_ST.dimension_wh_code not in ('CANCELED')) then F.lead_time end) as lead_time

from (select * from #DWH_TABLE_SCHEMA.f_change_request where soft_deleted_flag='N')F
left join (select * from #DWH_TABLE_SCHEMA.d_change_request where soft_deleted_flag='N') D
on D.row_key = F.change_request_key and D.source_id = F.source_id
left join (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y' and soft_deleted_flag='N')DF
on D.row_key=DF.change_request_key and D.source_id=DF.source_id  
left join #DWH_TABLE_SCHEMA.d_lov_map CR_ST
on F.state_src_key = CR_ST.src_key and F.source_id = CR_ST.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map CR_TYPE
on F.type_src_key = CR_TYPE.src_key and F.source_id = CR_TYPE.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map CR_APPR
on F.approval_state_src_key=CR_APPR.src_key and D.source_id=CR_APPR.source_id
group by F.assignment_group_key, F.assigned_to_key, F.opened_on_key
) opened_change_requests
on base.assignment_group_key = opened_change_requests.assignment_group_key and base.assigned_to_key = opened_change_requests.assigned_to_key and opened_change_requests.opened_on_key = base.calendar_date_key
set base.emergency_change_requests=opened_change_requests.emergency_change_requests ,base.high_risk_change_requests=opened_change_requests.high_risk_change_requests ,
base.normal_change_requests=opened_change_requests.normal_change_requests, 
base.opened_change_failure_requests=opened_change_requests.opened_change_failure_requests,
base.opened_change_requests=opened_change_requests.opened_change_requests_count, base.rejected_change_requests=opened_change_requests.rejected_change_requests,
base.lead_time=opened_change_requests.lead_time,
updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Closed date as canonical date --

update #STG_TABLE_SCHEMA.f_a_change_smpo_dppc_final_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.closed_on_key, 

count(case when CR_ST.dimension_wh_code in ('CLOSED') then DF.change_request_key else null end) as closed_change_failure_requests,
count(F.change_request_key) as closed_change_requests,
count(case when CR_ST.dimension_wh_code in ('CLOSED') and CR_CODE.dimension_wh_code in ('UNSUCCESSFUL') then DF.change_request_key else null end) as rollback_change_requests,
count(case when DF.numerify_change_failure_flag='N' then DF.change_request_key else null end) as successful_change_failure_requests

from (select * from #DWH_TABLE_SCHEMA.f_change_request where soft_deleted_flag='N')F
left join (select * from #DWH_TABLE_SCHEMA.d_change_request where soft_deleted_flag='N') D
on D.row_key = F.change_request_key and D.source_id = F.source_id
left join (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y' and soft_deleted_flag='N')DF
on D.row_key=DF.change_request_key and D.source_id=DF.source_id  
left join #DWH_TABLE_SCHEMA.d_lov_map CR_ST
on F.state_src_key = CR_ST.src_key and F.source_id = CR_ST.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map CR_CODE
on DF.change_close_code_key = CR_CODE.src_key and DF.source_id = CR_CODE.source_id
group by F.assignment_group_key, F.assigned_to_key, F.closed_on_key
) closed_change_requests
on base.assignment_group_key = closed_change_requests.assignment_group_key and base.assigned_to_key = closed_change_requests.assigned_to_key and closed_change_requests.closed_on_key = base.calendar_date_key
set base.closed_change_failure_requests = closed_change_requests.closed_change_failure_requests,
base.closed_change_requests = closed_change_requests.closed_change_requests,
base.rollback_change_requests = closed_change_requests.rollback_change_requests,
base.successful_change_failure_requests = closed_change_requests.successful_change_failure_requests, updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Start date as canonical date --

update #STG_TABLE_SCHEMA.f_a_change_smpo_dppc_final_base base
join (
select F.assignment_group_key, F.assigned_to_key, OutageF.start_on_key, 
count(F.outage_key) as caused_by_change_outages,
count(case when (CR_ST.dimension_wh_code in ('PLANNED OUTAGE') and CR_STATE.dimension_wh_code not in ('CANCELED')) then F.outage_key else null end) as planned_caused_by_change_outages,

count(distinct(case when F.outage_key<>0 and CR_ST.dimension_wh_code in ('PLANNED OUTAGE') and CR_STATE.dimension_wh_code not in ('CANCELED')
then F.change_request_key else null end)) as caused_by_change_requests_planned_outages

from (select * from #DWH_TABLE_SCHEMA.f_caused_by_change where soft_deleted_flag='N')F
left join (select * from #DWH_TABLE_SCHEMA.d_outage where soft_deleted_flag='N')Outage
on F.outage_key=Outage.row_key and F.source_id=Outage.source_id
left join (select * from #DWH_TABLE_SCHEMA.f_outage where soft_deleted_flag='N')OutageF
on OutageF.outage_key=Outage.row_key and OutageF.source_id=Outage.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map CR_ST
on Outage.outage_type_src_key = CR_ST.src_key and Outage.source_id = CR_ST.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map CR_STATE
on CR_STATE.src_key=F.state_src_key and CR_STATE.source_id=F.source_id
group by F.assignment_group_key, F.assigned_to_key, OutageF.start_on_key
) outages_caused_by_change 
on base.assignment_group_key = outages_caused_by_change.assignment_group_key and base.assigned_to_key = outages_caused_by_change.assigned_to_key and 
outages_caused_by_change.start_on_key = base.calendar_date_key
set base.caused_by_change_outages = outages_caused_by_change.caused_by_change_outages,
base.planned_caused_by_change_outages = outages_caused_by_change.planned_caused_by_change_outages,
base.caused_by_change_requests_planned_outages = outages_caused_by_change.caused_by_change_requests_planned_outages,updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- Due date as canonical date --

update #STG_TABLE_SCHEMA.f_a_change_smpo_dppc_final_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.due_on_key,
count(case when D.overdue_flag='Y' then F.change_request_key else null end) as overdue_change_requests

from (select * from #DWH_TABLE_SCHEMA.f_change_request where soft_deleted_flag='N')F
inner join (select * from #DWH_TABLE_SCHEMA.d_change_request where soft_deleted_flag='N' and overdue_flag='Y')D
on F.change_request_key=D.row_key and F.source_id=D.source_id
group by F.assignment_group_key, F.assigned_to_key, F.due_on_key
) overdue_changes
on base.assignment_group_key = overdue_changes.assignment_group_key and base.assigned_to_key = overdue_changes.assigned_to_key and 
overdue_changes.due_on_key = base.calendar_date_key
set base.overdue_change_requests = overdue_changes.overdue_change_requests,updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

-- last_normal_to_emergency_changed_on_key date as canonical date --

update #STG_TABLE_SCHEMA.f_a_change_smpo_dppc_final_base base
join (
select F.assignment_group_key, F.assigned_to_key, F.last_normal_to_emergency_changed_on_key, 

count(case when (D.change_type_normal_to_emergency_flag='Y' and CR_ST.dimension_wh_code not in ('CANCELED')) then F.change_request_key else null end) as last_normal_to_emergency_changed_change_requests

from (select * from #DWH_TABLE_SCHEMA.f_change_request where soft_deleted_flag='N')F
inner join (select * from #DWH_TABLE_SCHEMA.d_change_request where soft_deleted_flag='N' and change_type_normal_to_emergency_flag='Y') D
on D.row_key = F.change_request_key and D.source_id = F.source_id
left join (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y' and soft_deleted_flag='N')DF
on D.row_key=DF.change_request_key and D.source_id=DF.source_id  
left join #DWH_TABLE_SCHEMA.d_lov_map CR_ST
on F.state_src_key = CR_ST.src_key and F.source_id = CR_ST.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map CR_TYPE
on F.type_src_key = CR_TYPE.src_key and F.source_id = CR_TYPE.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map CR_APPR
on F.approval_state_src_key=CR_APPR.src_key and D.source_id=CR_APPR.source_id
group by F.assignment_group_key, F.assigned_to_key, F.last_normal_to_emergency_changed_on_key
) normal_to_emergency_changed_change_requests
on base.assignment_group_key = normal_to_emergency_changed_change_requests.assignment_group_key 
and base.assigned_to_key = normal_to_emergency_changed_change_requests.assigned_to_key 
and normal_to_emergency_changed_change_requests.last_normal_to_emergency_changed_on_key = base.calendar_date_key
set base.last_normal_to_emergency_changed_change_requests=normal_to_emergency_changed_change_requests.last_normal_to_emergency_changed_change_requests,
updated_on = CURRENT_TIMESTAMP, base.to_delete_flag = 'N';

delete from #STG_TABLE_SCHEMA.f_a_change_smpo_dppc_final_base where to_delete_flag = 'Y';