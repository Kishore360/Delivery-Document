drop table if exists #STG_TABLE_SCHEMA.f_n_lov_snapshot_smpo_dppc_final_base_filtered; 

create table if not exists #STG_TABLE_SCHEMA.f_n_lov_snapshot_smpo_dppc_final_base_filtered like #STG_TABLE_SCHEMA.f_n_lov_snapshot_smpo_dppc_final_base;

insert into #STG_TABLE_SCHEMA.f_n_lov_snapshot_smpo_dppc_final_base_filtered
select * from #STG_TABLE_SCHEMA.f_n_lov_snapshot_smpo_dppc_final_base F
where F.soft_deleted_flag = 'N' 
AND F.dimension_class IN (
'WH_CHANGE_REQUEST_GROWTH_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_PLANNED_OUTAGES_GROWTH_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_CHANGE_SUCCESS_RATE_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_HIGH_RISK_CHANGE_RATE_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_EMERGENCY_CHANGE_RATE_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_AVG_CHANGE_LEAD_TIME_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_OVERDUE_CHANGE_GROWTH_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_NORMAL_TO_EMERGENCY_RATE_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_ROLLBACK_RATE_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_REJECTION_RATE_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_CHANGE_DATA_QUALITY_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_AVG_CHANGE_LEAD_TIME_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_EMERGENCY_CHANGE_RATE_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_CHANGE_REQUEST_GROWTH_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_HIGH_RISK_CHANGE_RATE_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_OVERDUE_CHANGE_GROWTH_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_PLANNED_OUTAGES_GROWTH_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_REJECTION_RATE_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_ROLLBACK_RATE_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_CHANGE_SUCCESS_RATE_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_NORMAL_TO_EMERGENCY_RATE_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_CHANGE_DATA_QUALITY_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_DELIVERY_PERFORMANCE_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_PROCESS_COMPLIANCE_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_DELIVERY_PERFORMANCE_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_PROCESS_COMPLIANCE_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST',
'WH_INCIDENT_GROWTH_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_MAJOR_INCIDENT_SLA_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_MINOR_INCIDENT_SLA_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_MTTR_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_AVG_HANDLE_TIME_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_BACKLOG_GROWTH_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_REOPEN_RATE_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_GENRIC_CI_USAGE_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_INCIDENT_DATA_QUALITY_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_PENDING_STATUS_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_AVG_BACKLOG_AGE_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_REPRIORITIZATION_RATE_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_INCIDENT_GROWTH_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_MAJOR_INCIDENT_SLA_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_MINOR_INCIDENT_SLA_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_MTTR_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_AVG_HANDLE_TIME_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_BACKLOG_GROWTH_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_REOPEN_RATE_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_GENRIC_CI_USAGE_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_INCIDENT_DATA_QUALITY_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_PENDING_STATUS_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_AVG_BACKLOG_AGE_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_REPRIORITIZATION_RATE_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_DELIVERY_PERFORMANCE_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_PROCESS_COMPLAINCE_WEIGHTAGE_SMPO_DPPC~INCIDENT',
'WH_DELIVERY_PERFORMANCE_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_PROCESS_COMPLAINCE_THRESHOLD_SMPO_DPPC~INCIDENT',
'WH_PROBLEM_GROWTH_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_AVG_AGE_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_TASK_SLA_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_BACKLOG_GROWTH_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_TASK_BACKLOG_GROWTH_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEMS_CHANGE_RELATED_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_REOCCURRENCE_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_AVG_BACKLOG_AGE_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_REPRIORITIZATION_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_REOPEN_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_DATA_QUALITY_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_TASKS_OVERDUE_GROWTH_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_AVG_AGE_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_AVG_BACKLOG_AGE_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_BACKLOG_GROWTH_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_DATA_QUALITY_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_GROWTH_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_REOCCURRENCE_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_REOPEN_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_REPRIORITIZATION_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_TASK_BACKLOG_GROWTH_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_TASK_SLA_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_TASKS_OVERDUE_GROWTH_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEMS_CHANGE_RELATED_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_DELIVERY_PERFORMANCE_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_PROCESS_COMPLIANCE_THRESHOLD_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_DELIVERY_PERFORMANCE_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_PROBLEM_PROCESS_COMPLIANCE_WEIGHTAGE_SMPO_DPPC~PROBLEM',
'WH_REQUEST_GROWTH_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_REQUEST_SLA_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_BACKLOG_GROWTH_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_AVG_HANDLE_TIME_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_AVG_OPEN_TO_CLOSE_DURATION_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_DISTINCT_FULLFILLERS_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_PENDING_STATUS_USAGE_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_AVG_BACKLOG_AGE_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_REPRIORITIZATION_RATE_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_REASSIGNMENT_RATE_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_GENERIC_CATALOG_ITEM_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_OVERDUE_RATE_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_AVG_BACKLOG_AGE_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_BACKLOG_GROWTH_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_DISTINCT_FULLFILLERS_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_GENERIC_CATALOG_ITEM_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_REQUEST_GROWTH_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_AVG_OPEN_TO_CLOSE_DURATION_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_PENDING_STATUS_USAGE_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_REASSIGNMENT_RATE_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_REPRIORITIZATION_RATE_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_REQUEST_SLA_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_AVG_HANDLE_TIME_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_OVERDUE_RATE_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_DELIVERY_PERFORMANCE_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_PROCESS_COMPLIANCE_WEIGHTAGE_SMPO_DPPC~REQUEST_ITEM',
'WH_DELIVERY_PERFORMANCE_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_PROCESS_COMPLIANCE_THRESHOLDS_SMPO_DPPC~REQUEST_ITEM',
'WH_CHANGE_RATE_WITH_PLANNED_OUTAGES_WEIGHTAGE_SMPO_DPPC~CHANGE_REQUEST',
'WH_CHANGE_RATE_WITH_PLANNED_OUTAGES_THRESHOLD_SMPO_DPPC~CHANGE_REQUEST'
);