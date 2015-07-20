
select case when count(1) >0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then CONCAT( CAST(COUNT(1) AS CHAR(10)), ' invalid dormancy_age_key set for <<tablename>>') 
else 'SUCCESS' end as Message
from <<tenant>>_mdwdb.dwh_d_lov a , 
					(select  TIMESTAMPDIFF(DAY,case when i.changed_on is null then 0 else i.changed_on end
							,rh.start_time) as dormancy_in_days,
							i.row_key,i.state_src_code,i.dormancy_age_key
					from <<tenant>>_mdwdb.<<tablename>> i
					join <<tenant>>_mdwdb.lsm_ls_etl_task_run_history rh
					on ( task_name = 'ITSM_CUSTOM_MEASURE'
					and etl_run_id = (select max(etl_run_id) 
					from <<tenant>>_mdwdb.lsm_ls_etl_task_run_history))	
					 ) as x 
where x.dormancy_in_days between a.lower_range_value and a.upper_range_value 
and dimension_class like '%#DIMENSION_CLASS%'
and case when x.state_src_code in (6,7) then -1 else a.row_key end <> x.dormancy_age_key

