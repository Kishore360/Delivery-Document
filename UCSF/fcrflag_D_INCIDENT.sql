SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from (
select s.sys_id,s.number, s.u_first_call_resolve,i.row_id,i.incident_number, i.first_call_resolution_flag,
case when s.u_first_call_resolve = '1' then 'Y' when s.u_first_call_resolve ='0' then 'N' else null end as fcrflag from ucsf_mdsdb.incident_final s
inner join ucsf_workdb.dwh_d_incident i on s.sys_id collate utf8_unicode_ci=i.row_id and s.sourceinstance = i.source_id
)A where  coalesce(first_call_resolution_flag,' ')<>coalesce(fcrflag,' ')
 ) c;