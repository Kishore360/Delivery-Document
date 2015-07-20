
select case when count(1) <>0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) <>0 then 'age calculation is not valid' else 'SUCCESS' end as Message
from (select f.1 from usf_mdwdb.#DWH_TABLE_NAME f 
join usf_mdwdb.dwh_d_calendar_date dat 
on f.opened_on_key = dat.row_key 
join usf_mdwdb.dwh_d_lov_map br 
on f.state_src_key = br.src_key 
JOIN usf_mdwdb.dwh_d_lov wh_lov 
ON wh_lov.row_key = br.wh_key 
join usf_mdwdb.lsm_ls_etl_task_run_history rh
on ( task_name = 'ITSM_CUSTOM_MEASURE'
and etl_run_id = (select max(etl_run_id) from usf_mdwdb.lsm_ls_etl_task_run_history))
where br.dimension_class = 'REQUEST_STATE~SC_REQUEST'
and br.dimension_wh_code = 'OPEN'
and age <> datediff(date(rh.start_time),date(calendar_date))
union
select f.1 from usf_mdwdb.#DWH_TABLE_NAME f 
join usf_mdwdb.dwh_d_calendar_date dat 
on f.opened_on_key = dat.row_key 
join usf_mdwdb.dwh_d_lov_map br 
on f.state_src_key = br.src_key 
JOIN usf_mdwdb.dwh_d_lov wh_lov 
ON wh_lov.row_key = br.wh_key 
join usf_mdwdb.lsm_ls_etl_task_run_history rh
on ( task_name = 'ITSM_CUSTOM_MEASURE'
and etl_run_id = (select max(etl_run_id) from usf_mdwdb.lsm_ls_etl_task_run_history))
where br.dimension_class = 'REQUEST_STATE~SC_REQUEST'
and br.dimension_wh_code <> 'OPEN'
and age <> 0
) A
