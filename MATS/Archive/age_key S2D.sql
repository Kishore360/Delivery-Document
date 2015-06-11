

select case when count(*) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) > 0 then CONCAT( CAST(COUNT(*) AS CHAR(10)), ' invalid aging_key set for #TABLE_NAME') 
else 'SUCCESS' end as Message
 from #TABLE_SCHEMA.d_lov a , 
					(select  TIMESTAMPDIFF(DAY,c.calendar_date,rh.start_time) as age_in_days, i.row_key,i.age_key
					from #TABLE_SCHEMA.#TABLE_NAME i
					inner join #TABLE_SCHEMA.d_calendar_date c
					on c.row_key = i.opened_on_key 
					join #TABLE_SCHEMA.lsm_ls_etl_task_run_history rh
					on ( task_name = 'ITSM_CUSTOM_MEASURE'
					and etl_run_id = (select max(etl_run_id) 
					from #TABLE_SCHEMA.lsm_ls_etl_task_run_history))	
					where c.source_id=0
					and i.state_src_code not in(#STATE_CODE_LIST) ) as x 
where x.age_in_days between a.lower_range_value and a.upper_range_value 
and dimension_class like '%#DIMENSION_CLASS%'
and a.row_key <>x.age_key

