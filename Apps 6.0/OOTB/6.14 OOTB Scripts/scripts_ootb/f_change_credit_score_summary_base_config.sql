drop table if exists #STG_TABLE_SCHEMA.f_change_credit_score_summary_base;

CREATE TABLE if not exists #STG_TABLE_SCHEMA.f_change_credit_score_summary_base (
  created_by varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  department_key bigint(20) DEFAULT NULL,
  application_key bigint(20) DEFAULT NULL,
  production_changes bigint(20) DEFAULT NULL,
  changed_on datetime DEFAULT NULL,
  unapproved_changes bigint(20) DEFAULT NULL,
  default_credit_score bigint(20) DEFAULT NULL,
  outage_deduction decimal(28,10) DEFAULT NULL,
  opened_changes bigint(20) DEFAULT NULL,
  de_prioritised_incident_deduction decimal(28,10) DEFAULT NULL,
  configuration_item_key bigint(20) DEFAULT NULL,
  assigned_to_key bigint(20) DEFAULT NULL,
  change_type_change_deduction decimal(28,10) DEFAULT NULL,
  changed_by varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  minor_incident_deduction decimal(28,10) DEFAULT NULL,
  major_incident_deduction decimal(28,10) DEFAULT NULL,
  assignment_group_key bigint(20) DEFAULT NULL,
  source_id smallint(6) DEFAULT NULL,
  row_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  problem_task_deduction decimal(28,10) DEFAULT NULL,
  business_service_key bigint(20) DEFAULT NULL,
  overdue_change_deduction decimal(28,10) DEFAULT NULL,
  unsuccessful_changes bigint(20) DEFAULT NULL,
  minimum_credit_score bigint(20) DEFAULT NULL,
  dw_updated_on datetime DEFAULT NULL,
  successful_changes bigint(20) DEFAULT NULL,
  created_on datetime DEFAULT NULL
 ) ;
 
 delete from #STG_TABLE_SCHEMA.f_change_credit_score_summary_base;
 
 INSERT INTO #STG_TABLE_SCHEMA.f_change_credit_score_summary_base(row_id,major_incident_deduction,minor_incident_deduction,change_type_change_deduction,problem_task_deduction,overdue_change_deduction,assignment_group_key,assigned_to_key,department_key,application_key,business_service_key,configuration_item_key,default_credit_score,minimum_credit_score,
unsuccessful_changes,successful_changes,unapproved_changes,production_changes,opened_changes,
changed_on,created_on,changed_by,outage_deduction,source_id,created_by,de_prioritised_incident_deduction)
 
 select concat(f.assignment_group_key,f.assigned_to_key,f.department_key ,f.application_key,f.business_service_key,f.configuration_item_key) as row_id,sum(case when task_type = 'INC_MAJOR' and task_priority in ('CRITICAL','HIGH') then debit_score else null end) as major_incident_deduction,
sum(case when task_type = 'INC_MINOR' and task_priority in ('LOW','MEDIUM') then debit_score else null end) as minor_incident_deduction,
sum(case when task_type = 'CHG_CT' then debit_score else null end) as change_type_change_deduction,
sum(case when task_type = 'PRB_TASK' and task_priority in ('HIGH','MEDIUM','LOW') then debit_score else null end) as problem_task_deduction,
sum(case when task_type = 'CHG_OVERDUE' then debit_score else null end) as overdue_change_deduction,
f.assignment_group_key, f.assigned_to_key, f.department_key
 ,f.application_key,f.business_service_key,f.configuration_item_key, '800' as default_credit_score,
'200' minimum_credit_score,SQ.unsuccessful_changes,SQ.successful_changes,SQB.unapproved_changes,SQB.production_changes,SQB.opened_changes,
f.changed_on,f.created_on, f.changed_by, null as outage_deduction, f.source_id, f.created_by, null as de_prioritised_incident_deduction
from (select * from #DWH_TABLE_SCHEMA.f_change_credit_score where soft_deleted_flag = 'N') f
left join 
(select 
f_chg.assignment_group_key,f_chg.assigned_to_key,f_chg.application_key,f_chg.business_service_key,f_chg.configuration_item_key,inc.department_key
,SUM(case when d_f.numerify_change_failure_flag ='N' then 1 else 0 end) as successful_changes
,SUM(case when d_f.numerify_change_failure_flag ='Y' then 1 else 0 end) as unsuccessful_changes
from #DWH_TABLE_SCHEMA.d_change_request d_chg
left join #DWH_TABLE_SCHEMA.f_change_request f_chg
on f_chg.change_request_key = d_chg.row_key
left join #DWH_TABLE_SCHEMA.d_change_failure d_f
on d_f.row_id=d_chg.row_id
left join #DWH_TABLE_SCHEMA.d_internal_contact inc
on f_chg.opened_by_key=inc.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map map
on f_chg.state_src_key=map.src_key
left join (select max(lastupdated)as lastupdated,source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness o_d group by source_id) o_d
on o_d.source_id = f_chg.source_id
where map.dimension_wh_code = 'CLOSED' and d_f.current_flag = 'Y'
and timestampdiff(second,d_chg.closed_on,o_d.lastupdated)/86400  between 0 and 150
group by
f_chg.assignment_group_key,f_chg.assigned_to_key,inc.department_key,
f_chg.application_key,f_chg.business_service_key,f_chg.configuration_item_key) SQ
on  SQ.assignment_group_key = f.assignment_group_key
and SQ.assigned_to_key = f.assigned_to_key
and SQ.department_key = f.department_key
and SQ.application_key = f.application_key
and SQ.business_service_key = f.business_service_key
and SQ.configuration_item_key = f.configuration_item_key
left join 
(select 
f_chg.assignment_group_key,f_chg.assigned_to_key,f_chg.application_key,f_chg.business_service_key,f_chg.configuration_item_key,inc.department_key
,SUM(case when d_chg.production_change_flag='Y' then 1 else 0 end) as production_changes
,SUM(case when d_chg.approval_flag='N' then 1 else 0 end) as unapproved_changes
,count(distinct f_chg.change_request_key) as opened_changes
from #DWH_TABLE_SCHEMA.d_change_request d_chg
left join #DWH_TABLE_SCHEMA.f_change_request f_chg
on f_chg.change_request_key = d_chg.row_key
left join #DWH_TABLE_SCHEMA.d_internal_contact inc
on f_chg.opened_by_key=inc.row_key
left join (select max(lastupdated) as lastupdated,source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness o_d group by source_id) o_d
on o_d.source_id = f_chg.source_id
where timestampdiff(second,d_chg.opened_on,o_d.lastupdated)/86400  between 0 and 150
group by
f_chg.assignment_group_key,f_chg.assigned_to_key,inc.department_key,
f_chg.application_key,f_chg.business_service_key,f_chg.configuration_item_key) SQB
on  SQB.assignment_group_key = f.assignment_group_key
and SQB.assigned_to_key = f.assigned_to_key
and SQB.department_key = f.department_key
and SQB.application_key = f.application_key
and SQB.business_service_key = f.business_service_key
and SQB.configuration_item_key = f.configuration_item_key
group by f.assignment_group_key, f.assigned_to_key, f.department_key
,f.application_key,f.business_service_key,f.configuration_item_key;
