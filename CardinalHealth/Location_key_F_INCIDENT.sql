SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from cardinalhealth_mdsdb.incident_final a
inner join cardinalhealth_workdb.dwh_f_incident b on a.sys_id collate utf8_unicode_ci = b.row_id and a.sourceinstance=b.source_id
left outer join cardinalhealth_workdb.dwh_d_location c on 
 coalesce(a.u_incident_location collate utf8_unicode_ci,' ') = coalesce(c.row_id,' ') 
 and b.row_key <10000
 where case when  a.u_incident_location is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end <> b.incident_location_key_c
) c;