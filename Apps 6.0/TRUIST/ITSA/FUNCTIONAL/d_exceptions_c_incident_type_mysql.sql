select case when count(1)>0 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>0 then 'Data mismatch for d_exceptions_c_incident_type'  ELSE 'SUCCESS'  END as Message
-- select a.u_exception_status ,b.exception_status
from truist_mdsdb.u_exception_final a
join truist_mdwdb.d_exceptions_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.u_incident_type<>b.incident_type
and a.cdctype='X';