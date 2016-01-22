SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from  bhn_mdsdb.sys_user_final b
join bhn_mdwdb.d_internal_contact a 
on b.manager = right(a.row_id,32)
join bhn_mdwdb.d_internal_contact c
on b.sys_id =right(c.row_id,32) and c.source_id=b.sourceinstance
where a.row_key <> c.manager_c_key