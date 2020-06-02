select case when failure_probability_2_null_chk <>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN failure_probability_2_null_chk <>0 THEN ' failure_probability_2 has null' ELSE  'SUCCESS' END as Message
from 
(

select 
    count(case when failure_probability_2 is null then 1 else 0 end) as failure_probability_2_null_chk
  --  sum(failure_probability_2 ) as failure_probability_2_value_chk, 
  --  sum( failure_probability_3 ) as failure_probability_3_value_chk
 from #DWH_TABLE_SCHEMA.d_change_failure
where current_flag = 'Y' and assignee_prior_changes>=0 and assignment_group_prior_changes>=0 and ci_class_prior_changes>=0 and ci_prior_changes>=0
and etl_run_number<>(Select max(etl_run_number) from #DWH_TABLE_SCHEMA.d_change_failure) and row_key not in (-1,0)
)a