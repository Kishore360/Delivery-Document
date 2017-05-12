select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,
'f_incident' FACT_TABLE 
from  <<tenant>>_mdwdb.f_incident
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_problem' FACT_TABLE from  <<tenant>>_mdwdb.f_problem
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_change_request' 
FACT_TABLE from  <<tenant>>_mdwdb.f_change_request
union all

select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_hr_change' FACT_TABLE from  <<tenant>>_mdwdb.f_hr_change
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_keyword' FACT_TABLE from  <<tenant>>_mdwdb.f_keyword
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_outage' FACT_TABLE from  <<tenant>>_mdwdb.f_outage
union all

select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_request' FACT_TABLE from  <<tenant>>_mdwdb.f_request
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_request_item' FACT_TABLE from  <<tenant>>_mdwdb.f_request_item
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_response' FACT_TABLE from  <<tenant>>_mdwdb.f_response
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_task_sla' FACT_TABLE from  <<tenant>>_mdwdb.f_task_sla

union all

select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_time_card' FACT_TABLE from  <<tenant>>_mdwdb.f_time_card
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_request_task' FACT_TABLE from  <<tenant>>_mdwdb.f_request_task
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_t_task_activity' FACT_TABLE from  <<tenant>>_mdwdb.f_t_task_activity
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_task_survey' FACT_TABLE from  <<tenant>>_mdwdb.f_task_survey

union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_outage_task' FACT_TABLE from  <<tenant>>_mdwdb.f_outage_task
union all
select case when count(distinct etl_run_number)<2 then 'FULL LOAD' else 'INCREMENTAL LOAD' END LOAD_TYPE,'f_problem_task' FACT_TABLE from  <<tenant>>_mdwdb.f_problem_task
