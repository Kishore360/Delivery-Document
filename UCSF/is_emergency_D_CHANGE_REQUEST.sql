SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt  from(
select s.sys_id, s.u_is_emergency,i.row_id,i.change_request_number, i.is_emergency_c ,
case  when s.u_is_emergency ='Yes' then 'Y' else 'N' end as emergency from ucsf_mdsdb.change_request_final s
inner join ucsf_workdb.dwh_d_change_request i on s.sys_id collate utf8_unicode_ci=i.row_id ) A
where coalesce(emergency collate utf8_unicode_ci,' ')<>coalesce(is_emergency_c ,' ')
) c;