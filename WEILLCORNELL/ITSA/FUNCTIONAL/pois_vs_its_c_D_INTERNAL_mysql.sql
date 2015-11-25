SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt from weillcornell_mdwdb.d_internal_organization a inner join 
weillcornell_mdsdb.sys_user_group_final b on a.row_id = CONCAT('GROUP~',sys_id) collate utf8_unicode_ci and a.row_key <100
where case when b.name like 'PO%' then 'POIS' else 'ITS' end <> a.pois_vs_its_c ) c;


 