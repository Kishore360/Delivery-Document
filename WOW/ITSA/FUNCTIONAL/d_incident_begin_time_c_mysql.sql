SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
wow_mdsdb.u_incident_outage_final a
left join wow_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where CONVERT_TZ(a.u_begin_time,'GMT','US/Mountain')<>b.begin_time_c;