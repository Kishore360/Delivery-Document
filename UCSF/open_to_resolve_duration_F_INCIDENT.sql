SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from ucsf_mdsdb.incident_final s
inner join ucsf_workdb.dwh_f_incident i on s.sys_id collate utf8_unicode_ci=i.row_id and s.sourceinstance = i.source_id
where timestampdiff(second,'1970-01-01 00:00:00',s.calendar_duration)  <>i.open_to_resolve_duration

) c;