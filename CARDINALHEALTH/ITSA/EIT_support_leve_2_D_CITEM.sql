SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from cardinalhealth_mdsdb.cmdb_ci_application_final a
inner join cardinalhealth_workdb.dwh_d_configuration_item b on a.sys_id collate utf8_unicode_ci = b.row_id and a.sourceinstance=b.source_id
left outer join cardinalhealth_workdb.dwh_d_internal_contact c on 
 coalesce(a.u_cah_level_3_ad collate utf8_unicode_ci,' ') = coalesce(c.row_id,' ') where case when  a.u_cah_level_3_ad is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end <> b.eit_sup_leader_key_c
) c;

