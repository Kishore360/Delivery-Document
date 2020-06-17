select case when count(1)>0 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>0 then 'Data mismatch for d_exceptions_c_update_count'  ELSE 'SUCCESS'  END as Message
-- select COALESCE(a.sys_mod_count,0),b.update_count
from bbandt_mdsdb.u_exception_final a
join bbandt_mdwdb.d_exceptions_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where COALESCE(a.sys_mod_count,0) <>b.update_count
and a.cdctype='X';



