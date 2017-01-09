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
									
								
