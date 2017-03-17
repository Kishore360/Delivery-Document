SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from gogo_mdsdb.incident_final s
inner join gogo_mdwdb.d_incident i on s.sys_id=i.row_id and s.sourceinstance=i.source_id
where coalesce(s.u_incident_type collate utf8_unicode_ci,' ')<>coalesce(i.incident_type ,' ')
) c;

