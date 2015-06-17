SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from cardinalhealth_mdsdb.cmdb_ci_application_final s
inner join cardinalhealth_workdb.dwh_d_configuration_item i on s.sys_id collate utf8_unicode_ci=i.row_id 
where coalesce(u_cah_business_criticality collate utf8_unicode_ci,' ')<>coalesce(i.cah_bus_criticl_src_code_c ,' ')
) c;
