SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt
from rambus_mdsdb.incident_final s
inner join rambus_workdb.dwh_d_incident i on s.sys_id collate utf8_unicode_ci=i.row_id 
where coalesce(s.u_resolvable_by collate utf8_unicode_ci,' ')<>coalesce(i.resolvable_by_c ,' ')

) c;