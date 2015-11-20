SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

ucsf_mdsdb.incident_final a
join ucsf_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where case when a.u_is_non_production = 1 THEN 'Y' ELSE 'N' END <>b.is_non_production_c_flag;