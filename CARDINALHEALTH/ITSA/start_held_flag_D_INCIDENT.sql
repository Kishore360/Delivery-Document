SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from (
select s.sys_id,s.number, s.u_srt_held,i.row_id,i.incident_number, i.srt_held_flag_c,
case when s.u_srt_held = '1' then 'Y' when s.u_srt_held ='0' then 'N' else null end as flag from cardinalhealth_mdsdb.incident_final s
inner join cardinalhealth_workdb.dwh_d_incident i on s.sys_id collate utf8_unicode_ci=i.row_id and s.sourceinstance = i.source_id
)A where  coalesce(srt_held_flag_c,' ')<>coalesce(flag,' ')
) c;

