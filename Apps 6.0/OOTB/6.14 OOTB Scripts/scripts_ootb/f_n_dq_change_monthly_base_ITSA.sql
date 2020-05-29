create table if not exists #STG_TABLE_SCHEMA.f_n_dq_change_monthly_fact_final_base (
  cdctype CHAR(1) DEFAULT NULL,
  changed_by VARCHAR(60) DEFAULT NULL,
  changed_on DATETIME DEFAULT NULL,
  created_by VARCHAR(60) DEFAULT NULL,
  created_on DATETIME DEFAULT NULL,
  dq_rules_configuration_key BIGINT(20) DEFAULT NULL,
  n_date DATE DEFAULT NULL,
  n_key BIGINT(20) DEFAULT NULL,
  lagging_count_of_month INT(20) DEFAULT NULL,
  sys_id VARCHAR(255) DEFAULT NULL,
  row_key BIGINT(20) NOT NULL AUTO_INCREMENT,
  rule_pass_status DECIMAL(28, 10) DEFAULT NULL,
  rule_run_date DATETIME DEFAULT NULL,
  rule_weight DECIMAL(28, 10) DEFAULT NULL,
  soft_deleted_flag CHAR(1) DEFAULT NULL,
  source_id SMALLINT(6) DEFAULT NULL,
  target_column VARCHAR(60) DEFAULT NULL,
  target_column_value VARCHAR(255) DEFAULT NULL,
  target_key BIGINT(20) DEFAULT NULL,
  inserted_on DATETIME DEFAULT NULL,
  PRIMARY KEY (row_key),
  UNIQUE KEY (sys_id, source_id, n_key)
  );
  
update #STG_TABLE_SCHEMA.f_n_dq_change_monthly_fact_final_base base
join #DWH_TABLE_SCHEMA.d_calendar_date CAL on CAL.month_start_date = date_format(base.n_date, '%Y-%m-%d')
set base.lagging_count_of_month = CAL.lagging_count_of_month
where base.lagging_count_of_month <> CAL.lagging_count_of_month;
  
delete from #STG_TABLE_SCHEMA.f_n_dq_change_monthly_fact_final_base where lagging_count_of_month <= 0;

insert into #STG_TABLE_SCHEMA.f_n_dq_change_monthly_fact_final_base
(cdctype, changed_by, changed_on, created_by, created_on, dq_rules_configuration_key, n_date, n_key, lagging_count_of_month, sys_id, rule_pass_status, rule_run_date, rule_weight, soft_deleted_flag, source_id, target_column, target_column_value, target_key, inserted_on)

select F.cdctype as cdctype,
F.changed_by as changed_by,
F.changed_on as changed_on,
F.created_by as created_by,
F.created_on as created_on,
F.dq_rules_configuration_key as dq_rules_configuration_key,
CAL.calendar_date as n_date,
CAL.row_key as n_key,
CAL.lagging_count_of_month as lagging_count_of_month,
F.row_id as sys_id,
F.rule_pass_status as rule_pass_status,
F.rule_run_date as rule_run_date,
F.rule_weight as rule_weight,
F.soft_deleted_flag as soft_deleted_flag,
F.source_id as source_id,
F.target_column as target_column,
F.target_column_value as target_column_value,
F.target_key as target_key,
CURRENT_TIMESTAMP as inserted_on

from #DWH_TABLE_SCHEMA.f_dq_change_fact F
cross join (
select distinct CAL_MN.calendar_date, CAL_MN.row_key, CAL.lagging_count_of_month
from #DWH_TABLE_SCHEMA.d_calendar_date CAL
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL_MN
ON (date_format(CAL.month_start_date,'%Y%m%d') = CAL_MN.row_id)
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL_CURR
on (date_format(current_timestamp,'%Y%m%d') = CAL_CURR.row_id)
join (select source_id, current_flag, target_table, retention, subject_area, calendar_code,day_of_week_month from #STG_TABLE_SCHEMA.lsm_ls_dw_aggregator where subject_area = 'ITSA_DQ_CHANGE' and target_table = 'f_n_dq_change_monthly_fact') lsm_aggregator
on CAL_CURR.calendar_code = lsm_aggregator.calendar_code and lsm_aggregator.target_table = 'f_n_dq_change_monthly_fact' and lsm_aggregator.subject_area = 'ITSA_DQ_CHANGE'
where CAL.lagging_count_of_month between 
(case when lsm_aggregator.current_flag = 'N' then CAL_CURR.lagging_count_of_month + 1 else CAL_CURR.lagging_count_of_month end) and
(select distinct case when max_lagging_count > 0 then CAL_CURR.lagging_count_of_month 
else case when date_format(current_timestamp,'%d') = lsm_aggregator.day_of_week_month then CAL_CURR.lagging_count_of_month + 1 else CAL_CURR.lagging_count_of_month end end
from (select max(lagging_count_of_month) max_lagging_count from #STG_TABLE_SCHEMA.f_n_dq_change_monthly_fact_final_base) SQ )
) CAL
where F.soft_deleted_flag <> 'Y';