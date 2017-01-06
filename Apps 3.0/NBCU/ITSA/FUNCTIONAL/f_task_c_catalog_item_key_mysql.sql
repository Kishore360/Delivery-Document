			SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from nbcu_mdsdb.task_final a 
left join nbcu_mdsdb.sc_req_item_final b on a.sys_id=b.sys_id
and a.sourceinstance=b.sourceinstance
join nbcu_mdwdb.f_task_c fs
on fs.row_id=a.sys_id and fs.source_id=a.sourceinstance
join nbcu_mdwdb.d_master_item d
									on d.row_id =  b.cat_item  AND d.source_id =  b.sourceinstance 
										AND DATE_FORMAT(fs.pivot_date, '%Y-%m-%d %H:%i:%s') 
									BETWEEN effective_from AND effective_to
									where catalog_item_key<> coalesce(d.row_key,case when cat_item is null then 0 else -1 end )
									
								

			SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from nbcu_mdsdb.task_final a 		
left join 	nbcu_mdwdb.d_lov d  on COALESCE( CONCAT('CONTACT_TYPE','~','TASK','~','~','~',UPPER(i.contact_type)),'UNSPECIFIED') =d.row_id
join nbcu_mdwdb.f_task_c fs
on fs.row_id=a.sys_id and fs.source_id=a.sourceinstance			
where contact_type_src_c_key<>coalesce(d.row_key,case when contact_type is null then 0 else -1 end  )
AND DATE_FORMAT(fs.pivot_date, '%Y-%m-%d %H:%i:%s') 
									BETWEEN effective_from AND effective_to		
									
									
									
												SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from nbcu_mdsdb.task_final a 		
left join 	nbcu_mdwdb.d_problem d  on a.sys_id =d.row_id
join nbcu_mdwdb.f_task_c fs
on fs.row_id=a.sys_id and fs.source_id=a.sourceinstance			
where problem_key<>coalesce(d.row_key,case when sys_id is null then 0 else -1 end  )

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from nbcu_mdsdb.task_final a 		
left join 	nbcu_mdwdb.d_problem_task d  on a.sys_id =d.row_id
join nbcu_mdwdb.f_task_c fs
on fs.row_id=a.sys_id and fs.source_id=a.sourceinstance			
where problem_key<>coalesce(d.row_key,case when sys_id is null then 0 else -1 end  )


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from nbcu_mdsdb.task_final a 		
left join 	nbcu_mdwdb.d_request d  on a.sys_id =d.row_id
join nbcu_mdwdb.f_task_c fs
on fs.row_id=a.sys_id and fs.source_id=a.sourceinstance			
where problem_key<>coalesce(d.row_key,case when sys_id is null then 0 else -1 end  )
									
									
									
									