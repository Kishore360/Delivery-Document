SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( 
select COUNT(*) as cnt
from spansion_mdsdb.incident_final a
inner join spansion_workdb.dwh_f_incident  b on a.sys_id collate utf8_unicode_ci=b.row_id  #and b.row_key <100
left outer join spansion_workdb.dwh_d_internal_contact c on a.closed_by collate utf8_unicode_ci=c.row_id #where a.closed_by is not null
 where case when  a.closed_by is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end <>b.last_resolved_by_key
)c
