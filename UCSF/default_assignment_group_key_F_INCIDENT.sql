SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM( select count(*) as cnt from (
select  a.sys_id,a.assigned_to, c.sys_id as user_sys_id,
case when  a.assigned_to is null then '0' 
 else case when c.sys_id is null or c.u_default_group is null then '-1' else c.u_default_group end end as u_default_group, 
b.default_assignment_group_key_c from ucsf_mdsdb.incident_final a 
inner join ucsf_workdb.dwh_f_incident b on a.sys_id collate utf8_unicode_ci = b.row_id and a.sourceinstance=b.source_id
and b.row_key < 1000 left outer join  ucsf_mdsdb.sys_user_final c on 
coalesce(a.assigned_to collate utf8_unicode_ci,'0') = coalesce(c.sys_id,'0')
)a
left outer join ucsf_workdb.dwh_d_internal_organization d on  
coalesce(a.u_default_group collate utf8_unicode_ci,' ') = coalesce(d.row_id,' ')
where case when  a.u_default_group is null then '0' 
 else case when d.row_key is null then '-1' else d.row_key end end  <> a.default_assignment_group_key_c

) c;
