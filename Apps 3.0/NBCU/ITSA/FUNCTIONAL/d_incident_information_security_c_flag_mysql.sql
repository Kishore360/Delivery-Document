SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
nbcu_mdsdb.incident_final a
join nbcu_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where IF(a.u_information_security = TRUE,'Y','N')<> b.information_security_c_flag;