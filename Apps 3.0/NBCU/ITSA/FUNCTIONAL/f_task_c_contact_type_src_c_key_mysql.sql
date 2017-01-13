SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from nbcu_mdsdb.task_final a 		
left join 	nbcu_mdwdb.d_lov d  on COALESCE( CONCAT('CONTACT_TYPE','~','TASK','~','~','~',UPPER(a.contact_type)),'UNSPECIFIED') =d.row_id
join nbcu_mdwdb.f_task_c fs
on fs.row_id=a.sys_id and fs.source_id=a.sourceinstance			
where contact_type_src_c_key<>coalesce(d.row_key,case when contact_type is null then 0 else -1 end  )
	
									
									