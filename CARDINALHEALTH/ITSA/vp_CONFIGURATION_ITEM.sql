SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from cardinalhealth_mdsdb.cmdb_ci_final a
inner join cardinalhealth_workdb.dwh_d_configuration_item 	 b on a.sys_id collate utf8_unicode_ci = b.row_id 
and a.sourceinstance=b.source_id 
left outer join cardinalhealth_mdsdb.sys_user_final c on a.owned_by  = c.sys_id 
 left outer join cardinalhealth_workdb.dwh_d_internal_contact c1 on c.u_vp collate utf8_unicode_ci = c1.row_id 
  where case when  a.owned_by  is null or c.u_vp is null or c.sys_id is null  or c1.row_id is null then ' ' 
 else c1.full_name end <> b.vp_c
) c;