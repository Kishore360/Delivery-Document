SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt
 from aaa_mdsdb.incident_final a 
inner  join aaa_workdb.dwh_d_incident b on a.sys_id collate utf8_unicode_ci=b.row_id 
and a.sourceinstance=b.source_id
left outer join aaa_mdsdb.rm_story_final rm on rm.sys_id=a.u_story 
where  coalesce(rm.short_description,'No Story Found') <>b.story_c collate utf8_unicode_ci
) c;