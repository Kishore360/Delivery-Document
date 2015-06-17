SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from cardinalhealth_mdsdb.cmdb_ci_final s
inner join cardinalhealth_workdb.dwh_d_configuration_item i on s.sys_id collate utf8_unicode_ci=i.row_id 
where coalesce(s.u_ci_type collate utf8_unicode_ci,' ')<>coalesce(i.ci_type ,' ')
) c;

