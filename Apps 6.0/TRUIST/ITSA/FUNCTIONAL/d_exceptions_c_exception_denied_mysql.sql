select case when count(1)>0 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>0 then 'Data mismatch for d_exceptions_c_exception_denied'  ELSE 'SUCCESS'  END as Message
-- select a.u_exception_denied ,b.exception_denied
from truist_mdsdb.u_exception_final a
join truist_mdwdb.d_exceptions_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where case when a.u_exception_denied=1 then 'Y' else 'N' end <>b.exception_denied
and a.cdctype='X';
