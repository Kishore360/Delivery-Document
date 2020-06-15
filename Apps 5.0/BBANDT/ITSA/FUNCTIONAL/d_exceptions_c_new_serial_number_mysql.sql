select case when count(1)>0 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>0 then 'Data mismatch for d_exceptions_c_new_serial_number'  ELSE 'SUCCESS'  END as Message
-- select a.u_new_serial_number,b.new_serial_number
from bbandt_mdsdb.u_exception_final a
join bbandt_mdwdb.d_exceptions_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.u_new_serial_number<>b.new_serial_number
and a.cdctype='X';

