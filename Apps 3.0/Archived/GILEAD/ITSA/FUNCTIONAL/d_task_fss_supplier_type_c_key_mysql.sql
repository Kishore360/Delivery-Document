SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
(
select count(1) as cnt
from gilead_mdwdb.d_task_fss_c a
INNER JOIN gilead_mdsdb.u_task_fss_final src 
ON a.row_id = src.sys_id
AND a.source_id = src.sourceinstance
left join gilead_mdwdb.d_lov c
on CONCAT('SUPPLIER_C~TASK_FSS_C~~~',src.u_supplier_type)=c.src_rowid
where c.row_key<>a.supplier_type_c_key
)a;