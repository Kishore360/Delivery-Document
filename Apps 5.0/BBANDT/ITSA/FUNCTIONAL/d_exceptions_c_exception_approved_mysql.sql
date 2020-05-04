select case when count(1)>0 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>0 then 'Data mismatch for d_exceptions_c_exception_approved'  ELSE 'SUCCESS'  END as Message
-- select distinct a.u_exception_approved ,b.exception_approved
from bbandt_mdsdb.u_exception_final a
join bbandt_mdwdb.d_exceptions_c b
on  a.sys_id=b.row_id  and a.sourceinstance=b.source_id
where case when a.u_exception_approved=1 then 'Y' else 'N'end  <>b.exception_approved
and a.cdctype='X';