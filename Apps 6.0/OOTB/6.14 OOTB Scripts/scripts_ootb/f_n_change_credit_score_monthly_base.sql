create table if not exists #STG_TABLE_SCHEMA.f_n_change_credit_score_monthly_final_base (
  cdctype CHAR(1) DEFAULT NULL,
  de_prioritised_incident_deduction DECIMAL(28, 10) DEFAULT NULL,
  application_key BIGINT(20) DEFAULT NULL,
  change_type_change_deduction DECIMAL(28, 10) DEFAULT NULL,
  outage_deduction DECIMAL(28, 10) DEFAULT NULL,
  configuration_item_key BIGINT(20) DEFAULT NULL,
  overdue_change_deduction DECIMAL(28, 10) DEFAULT NULL,
  changed_by VARCHAR(60) DEFAULT NULL,
  row_key BIGINT(20) NOT NULL AUTO_INCREMENT,
  department_key BIGINT(20) DEFAULT NULL,
  inserted_on DATETIME DEFAULT NULL,
  created_by VARCHAR(60) DEFAULT NULL,
  unapproved_changes BIGINT(20) DEFAULT NULL,
  problem_task_deduction DECIMAL(28, 10) DEFAULT NULL,
  changed_on DATETIME DEFAULT NULL,
  production_changes BIGINT(20) DEFAULT NULL,
  assignment_group_key BIGINT(20) DEFAULT NULL,
  n_date DATE DEFAULT NULL,
  source_id SMALLINT(6) DEFAULT NULL,
  minimum_credit_score BIGINT(20) DEFAULT NULL,
  created_on DATETIME DEFAULT NULL,
  successful_changes BIGINT(20) DEFAULT NULL,
  n_key BIGINT(20) DEFAULT NULL,
  lagging_count_of_month INT(20) DEFAULT NULL,
  default_credit_score BIGINT(20) DEFAULT NULL,
  major_incident_deduction DECIMAL(28, 10) DEFAULT NULL,
  sys_id VARCHAR(255) DEFAULT NULL,
  unsuccessful_changes BIGINT(20) DEFAULT NULL,
  calendar_code DECIMAL(28, 10) DEFAULT NULL,
  assigned_to_key BIGINT(20) DEFAULT NULL,
  business_service_key BIGINT(20) DEFAULT NULL,
  minor_incident_deduction DECIMAL(28, 10) DEFAULT NULL,
  soft_deleted_flag CHAR(1) DEFAULT NULL,
  to_delete_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (row_key),
  unique KEY (sys_id, source_id, n_key)
  );
  
update #STG_TABLE_SCHEMA.f_n_change_credit_score_monthly_final_base base
join #DWH_TABLE_SCHEMA.d_calendar_date CAL on CAL.month_start_date = date_format(base.n_date, '%Y-%m-%d')
set base.lagging_count_of_month = CAL.lagging_count_of_month
where base.lagging_count_of_month <> CAL.lagging_count_of_month;
  
delete from #STG_TABLE_SCHEMA.f_n_change_credit_score_monthly_final_base where lagging_count_of_month <= 0;

insert into #STG_TABLE_SCHEMA.f_n_change_credit_score_monthly_final_base
(cdctype, de_prioritised_incident_deduction, application_key, change_type_change_deduction, outage_deduction, configuration_item_key, overdue_change_deduction, changed_by,  department_key, created_by, unapproved_changes, problem_task_deduction, changed_on, production_changes, assignment_group_key, n_date, source_id, minimum_credit_score, created_on, successful_changes, n_key, lagging_count_of_month, default_credit_score, major_incident_deduction, sys_id, unsuccessful_changes, assigned_to_key, business_service_key, minor_incident_deduction, soft_deleted_flag, inserted_on)

select F.cdctype as cdctype,
F.de_prioritised_incident_deduction as de_prioritised_incident_deduction,
F.application_key as application_key,
F.change_type_change_deduction as change_type_change_deduction,
F.outage_deduction as outage_deduction,
F.configuration_item_key as configuration_item_key,
F.overdue_change_deduction as overdue_change_deduction,
F.changed_by as changed_by,
F.department_key as department_key,
F.created_by as created_by,
F.unapproved_changes as unapproved_changes,
F.problem_task_deduction as problem_task_deduction,
F.changed_on as changed_on,
F.production_changes as production_changes,
F.assignment_group_key as assignment_group_key,
CAL.calendar_date as n_date,
F.source_id as source_id,
F.minimum_credit_score as minimum_credit_score,
F.created_on as created_on,
F.successful_changes as successful_changes,
CAL.row_key as n_key,
CAL.lagging_count_of_month as lagging_count_of_month,
F.default_credit_score as default_credit_score,
F.major_incident_deduction as major_incident_deduction,
F.row_id as sys_id,
F.unsuccessful_changes as unsuccessful_changes,
F.assigned_to_key as assigned_to_key,
F.business_service_key as business_service_key,
F.minor_incident_deduction as minor_incident_deduction,
F.soft_deleted_flag as soft_deleted_flag,
CURRENT_TIMESTAMP as inserted_on

from #DWH_TABLE_SCHEMA.f_change_credit_score_summary F
cross join (
select distinct CAL_MN.calendar_date, CAL_MN.row_key, CAL.lagging_count_of_month
from #DWH_TABLE_SCHEMA.d_calendar_date CAL
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL_MN
ON (date_format(CAL.month_start_date,'%Y%m%d') = CAL_MN.row_id)
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL_CURR
on (date_format(current_timestamp,'%Y%m%d') = CAL_CURR.row_id)
join (select source_id, current_flag, lagging_count_of_month,target_table, retention, subject_area, calendar_code from #STG_TABLE_SCHEMA.lsm_ls_dw_aggregator where subject_area = 'ITSA_CREDIT_SCORE' and target_table = 'f_n_change_credit_score_monthly') lsm_aggregator
on CAL_CURR.calendar_code = lsm_aggregator.calendar_code and lsm_aggregator.target_table = 'f_n_change_credit_score_monthly' and lsm_aggregator.subject_area = 'ITSA_CREDIT_SCORE'
where CAL.lagging_count_of_month between 
(case when lsm_aggregator.current_flag = 'N' then CAL_CURR.lagging_count_of_month + 1 else CAL_CURR.lagging_count_of_month end) and
(select distinct case when max_lagging_count > 0 then CAL_CURR.lagging_count_of_month 
else case when date_format(current_timestamp,'%d') = lsm_aggregator.day_of_week_month then CAL_CURR.lagging_count_of_month + 1 else CAL_CURR.lagging_count_of_month end end
from (select max(lagging_count_of_month) max_lagging_count from #STG_TABLE_SCHEMA.f_n_change_credit_score_monthly_final_base) SQ )
) CAL
where F.soft_deleted_flag <> 'Y';