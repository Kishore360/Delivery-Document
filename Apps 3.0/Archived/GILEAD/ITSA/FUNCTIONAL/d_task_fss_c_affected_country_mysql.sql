select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from
gilead_mdsdb.u_task_fss_final src
join gilead_mdwdb.d_task_fss_c trgt on src.sys_id =trgt.row_id and src.sourceinstance=2
where src.u_affected_country<>trgt.affected_country; 


