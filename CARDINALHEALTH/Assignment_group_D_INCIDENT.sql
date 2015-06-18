SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from cardinalhealth_workdb.dwh_d_incident a inner join cardinalhealth_workdb.dwh_f_incident i on a.row_id=i.row_id 
left outer join cardinalhealth_workdb.dwh_d_internal_organization b
on i.assignment_group_key = b.row_key
left outer join cardinalhealth_mdsdb.sys_user_group_final c on c.sys_id collate utf8_unicode_ci= b.row_id
left outer join cardinalhealth_mdsdb.sys_user_group_final c1 on c1.sys_id=coalesce(c.parent,' ')
where  case when c.parent is null or c1.u_segment is null then c.u_segment else c1.u_segment end collate utf8_unicode_ci
<> a.assignment_group_segment_c
) c;