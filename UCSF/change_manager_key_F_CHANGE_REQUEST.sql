SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt  from (
select  a.sys_id,a.u_change_manager, c.row_id,c.row_key,b.change_manager_key_c from ucsf_mdsdb.change_request_final a
inner join ucsf_workdb.dwh_f_change_request b on a.sys_id collate utf8_unicode_ci = b.row_id and a.sourceinstance=b.source_id
left outer join ucsf_workdb.dwh_d_internal_contact c on 
 coalesce(a.u_change_manager collate utf8_unicode_ci,' ') = coalesce(c.row_id,' ') where 
 case when  a.u_change_manager is null then '0' 
 else case when c.row_id is null then '-1' else c.row_key end end <> b.change_manager_key_c)A
) c;