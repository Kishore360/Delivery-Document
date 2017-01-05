


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from nbcu_mdsdb.task_final a 		
left join 	nbcu_mdwdb.d_task d  on COALESCE( CONCAT('CONTACT_TYPE','~','TASK','~','~','~',UPPER(i.contact_type)),'UNSPECIFIED') =d.row_id
join nbcu_mdwdb.f_t_task_activity_main fs
on fs.row_id=a.sys_id and fs.source_id=a.sourceinstance			
where task_wh_type IN ('incident','sc_req_item','sc_task') and 
task_ra_c_key<>coalesce(d.row_key,case when contact_type is null then 0 else -1 end  )
or update_count<>task_update_count_c
									
									