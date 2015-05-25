SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from#s.sys_id, s.u_desktop_provider,i.row_id, i.desktop_provider_c
(select sys_id from ucsf_mdsdb.incident_final s
inner join ucsf_workdb.dwh_d_incident i on s.sys_id collate utf8_unicode_ci=i.row_id
#and s.sourceinstance = i.source_id
where coalesce(s.u_desktop_provider collate utf8_general_ci , ' ')<>coalesce(i.desktop_provider_c,' ')) q1
) c;