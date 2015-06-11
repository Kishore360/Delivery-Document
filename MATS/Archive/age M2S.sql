

select case when count(1) <>0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) <>0 then 'age calculation is not valid' else 'SUCCESS' end as Message
from (select f.* from #TABLE_SCHEMA.#TABLE_NAME f 
join #TABLE_SCHEMA.d_calendar_date dat 
on f.opened_on_key = dat.row_key 
join #TABLE_SCHEMA.d_lov_map br 
on f.state_src_key = br.src_key 
JOIN #TABLE_SCHEMA.d_lov wh_lov 
ON wh_lov.row_key = br.wh_key 
join #TABLE_SCHEMA.lsm_ls_etl_task_run_history rh
on ( task_name = 'ITSM_CUSTOM_MEASURE'
and etl_run_id = (select max(etl_run_id) from #TABLE_SCHEMA.lsm_ls_etl_task_run_history))
where br.dimension_class = 'REQUEST_STATE~SC_REQUEST'
and br.dimension_wh_code = 'OPEN'
and age <> datediff(date(rh.start_time),date(calendar_date))
union
select f.* from #TABLE_SCHEMA.#TABLE_NAME f 
join #TABLE_SCHEMA.d_calendar_date dat 
on f.opened_on_key = dat.row_key 
join #TABLE_SCHEMA.d_lov_map br 
on f.state_src_key = br.src_key 
JOIN #TABLE_SCHEMA.d_lov wh_lov 
ON wh_lov.row_key = br.wh_key 
join #TABLE_SCHEMA.lsm_ls_etl_task_run_history rh
on ( task_name = 'ITSM_CUSTOM_MEASURE'
and etl_run_id = (select max(etl_run_id) from #TABLE_SCHEMA.lsm_ls_etl_task_run_history))
where br.dimension_class = 'REQUEST_STATE~SC_REQUEST'
and br.dimension_wh_code <> 'OPEN'
and age <> 0
) A
