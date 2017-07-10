SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from wow_mdsdb.sc_task_final a
join wow_mdwdb.d_request_task b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where COALESCE( b.hardware_status_c,'')<> COALESCE(a.u_hardware_status,'');