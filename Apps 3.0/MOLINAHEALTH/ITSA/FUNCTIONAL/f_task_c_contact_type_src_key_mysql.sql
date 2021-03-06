SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
(
select count(1) as cnt
from (select sys_id,sourceinstance,contact_type from molinahealth_mdsdb.task_final where sys_class_name='PROBLEM') src
 JOIN  molinahealth_mdwdb.f_task_c  a
ON a.row_id = src.sys_id
AND a.source_id = src.sourceinstance
 left join molinahealth_mdwdb.d_lov c
on CONCAT('CONTACT_TYPE~TASK~~~',src.contact_type)=c.src_rowid
where  c.dw_updated_on<a.dw_updated_on and  
COALESCE(c.row_key,CASE WHEN src.contact_type IS NULL THEN 0 else -1 end)
<>a.contact_type_c_key
)a;


