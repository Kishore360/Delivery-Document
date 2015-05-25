SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from cardinalhealth_mdsdb.incident_final a
inner join cardinalhealth_workdb.dwh_d_incident b on a.sys_id collate utf8_unicode_ci = b.row_id 
and a.sourceinstance=b.source_id left outer join cardinalhealth_mdsdb.u_module_final c on 
 coalesce(a.u_module,' ') = coalesce(c.sys_id ,' ') 
 where c.u_module_name collate utf8_unicode_ci <> b.module_c
) c;