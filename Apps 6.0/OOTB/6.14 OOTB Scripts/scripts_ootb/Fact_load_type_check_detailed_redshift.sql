select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,
'f_incident' FACT_TABLE 
from  #DWH_TABLE_SCHEMA.f_incident
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_problem' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_problem
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_change_request' 
FACT_TABLE from  #DWH_TABLE_SCHEMA.f_change_request
union all

select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_hr_change' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_hr_change
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_keyword' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_keyword
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_outage' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_outage
union all

select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_request' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_request
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_request_item' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_request_item
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_response' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_response
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_task_sla' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_task_sla

union all

select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_time_card' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_time_card
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_request_task' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_request_task
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_t_task_activity' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_t_task_activity
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_task_survey' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_task_survey

union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_outage_task' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_outage_task
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_problem_task' FACT_TABLE from  #DWH_TABLE_SCHEMA.f_problem_task
