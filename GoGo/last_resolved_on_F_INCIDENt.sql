SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt from gogo_mdsdb.incident_final s
inner join gogo_mdwdb.f_incident i on s.sys_id collate utf8_unicode_ci=i.row_id 
and s.sourceinstance=i.source_id
where  coalesce(DATE_FORMAT(CONVERT_TZ(s.u_resolved,'GMT','America/Chicago'),'%Y%m%d'),'0')
<>coalesce(i.last_resolved_on_key,'0')
) c;
 
