SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
(
select count(1) as cnt
from rambus_mdwdb.f_task_c a
 JOIN rambus_mdsdb.task_final src 
ON a.row_id = src.sys_id
AND a.source_id = src.sourceinstance
 join rambus_mdwdb.d_lov c
on CONCAT('CONTACT_TYPE_C~TASK_FSS_C~~~',src.contact_type)=c.src_rowid
where 
COALESCE(c.row_key,CASE WHEN src.contact_type IS NULL THEN 0 else -1 end)
<>a.contact_type_src_key
)a;


