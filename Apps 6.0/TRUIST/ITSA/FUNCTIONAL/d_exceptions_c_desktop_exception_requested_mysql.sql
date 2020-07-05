select case when count(1)>0 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>0 then 'Data mismatch for d_exceptions_c_desktop_exception_requested'  ELSE 'SUCCESS'  END as Message
-- select distinct a.u_desktop_exception_requested ,b.desktop_exception_requested
from truist_mdsdb.u_exception_final a
join truist_mdwdb.d_exceptions_c b
on  a.sys_id=b.row_id  and a.sourceinstance=b.source_id
where case when a.u_desktop_exception_requested=1 then 'Y' else 'N'end  <>b.desktop_exception_requested
and a.cdctype='X';