SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
(
select count(1) as cnt
from molinahealth_mdwdb.f_task_c a
 JOIN molinahealth_mdsdb.task_final src 
ON a.row_id = src.sys_id
AND a.source_id = src.sourceinstance
 left join molinahealth_mdwdb.d_lov c
on CONCAT('CONTACT_TYPE~TASK~~~',src.contact_type)=c.src_rowid
where 
COALESCE(c.row_key,CASE WHEN src.contact_type IS NULL THEN 0 else -1 end)
<>a.contact_type_c_key
)a;


