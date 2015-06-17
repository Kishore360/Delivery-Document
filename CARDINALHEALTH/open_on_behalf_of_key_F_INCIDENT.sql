SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from cardinalhealth_mdsdb.incident_final a
inner join cardinalhealth_workdb.dwh_f_incident b on a.sys_id collate utf8_general_ci = b.row_id and a.sourceinstance=b.source_id
and b.row_key < 100
left outer join cardinalhealth_workdb.dwh_d_internal_contact c on 
 coalesce(a.caller_id collate utf8_general_ci,' ') = coalesce(c.row_id,' ') where case when  a.caller_id is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end <> b.Opened_On_Behalf_Of_key_c
) c;