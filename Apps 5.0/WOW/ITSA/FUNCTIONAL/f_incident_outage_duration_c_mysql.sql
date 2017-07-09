
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_close_duration' ELSE 'SUCCESS' END as Message
FROM wow_mdsdb.u_incident_outage_final a
left join wow_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join wow_mdwdb.f_incident f
on b.row_key = f.incident_key
AND f.source_id = b.source_id AND b.outage_flag_c = 'Y'
WHERE TIMESTAMPDIFF(SECOND, CONVERT_TZ(a.u_begin_time,'GMT','US/Central'), coalesce(CONVERT_TZ(a.u_cleared,'GMT','US/Central'),CONVERT_TZ(a.u_begin_time,'GMT','US/Central'))) <> f.outage_duration_c
