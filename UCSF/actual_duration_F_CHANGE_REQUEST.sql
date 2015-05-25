SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt  from ucsf_mdsdb.change_request_final s
inner join ucsf_workdb.dwh_f_change_request i on s.sys_id collate utf8_unicode_ci=i.row_id and s.sourceinstance = i.source_id
where timestampdiff(second,'1970-01-01 00:00:00',s.u_duration)  <>i.actual_duration
) c;