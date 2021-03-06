SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message from 
(select count(1) cnt  from 
pan_mdsdb.incident_final a
left join pan_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where convert_tz(a.u_reminder_timestamp,'GMT','America/Los_Angeles')<>b.reminder_timestamp_c)x;