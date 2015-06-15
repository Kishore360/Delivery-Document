

select case when count(*) >0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) > 0 then CONCAT( CAST(COUNT(*) AS CHAR(10)), ' invalid dormancy_age_key set for #TABLE_NAME') 
else 'SUCCESS' end as Message
from #TABLE_SCHEMA.d_lov a , 
					(select  TIMESTAMPDIFF(DAY,case when i.changed_on is null then 0 else i.changed_on end
							,rh.start_time) as dormancy_in_days,
							i.row_key,i.state_src_code,i.dormancy_age_key
					from #TABLE_SCHEMA.#TABLE_NAME i
					join #TABLE_SCHEMA.lsm_ls_etl_task_run_history rh
					on ( task_name = 'ITSM_CUSTOM_MEASURE'
					and etl_run_id = (select max(etl_run_id) 
					from #TABLE_SCHEMA.lsm_ls_etl_task_run_history))	
					 ) as x 
where x.dormancy_in_days between a.lower_range_value and a.upper_range_value 
and dimension_class like '%#DIMENSION_CLASS%'
and case when x.state_src_code in (6,7) then -1 else a.row_key end <> x.dormancy_age_key

