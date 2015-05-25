SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt  from (
select  a.sys_id,a.u_cab_group, c.row_id,c.row_key,b.cab_group_key_c from ucsf_mdsdb.change_request_final a
inner join ucsf_workdb.dwh_f_change_request b on a.sys_id collate utf8_unicode_ci = b.row_id and a.sourceinstance=b.source_id
left outer join ucsf_workdb.dwh_d_internal_organization c on 
 coalesce(a.u_cab_group collate utf8_unicode_ci,' ') = coalesce(c.row_id,' ') where 
 case when  a.u_cab_group is null then '0' 
 else case when c.row_id is null then '-1' else c.row_key end end <> b.cab_group_key_c)A 

) c;