SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from cardinalhealth_mdsdb.sys_user_group_final a inner join  cardinalhealth_workdb.dwh_d_internal_organization b
on a.sys_id collate  utf8_unicode_ci = b.row_id
left outer join cardinalhealth_workdb.dwh_d_internal_contact c on a.u_vp collate  utf8_unicode_ci= c.row_id 
where case when  a.u_vp  is null then '0' 
 else case when c.row_id is null then '-1' else c.row_key end end <> b.vp_key_c
) c;