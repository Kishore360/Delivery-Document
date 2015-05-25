SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt  from ucsf_mdsdb.incident_final s
inner join ucsf_workdb.dwh_d_incident i on s.sys_id collate utf8_unicode_ci=i.row_id and s.u_incident_type  is not   null
where s.u_incident_type collate utf8_unicode_ci <>i.incident_type 
 ) c;