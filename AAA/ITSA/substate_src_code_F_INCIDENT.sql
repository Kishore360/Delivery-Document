SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt 
from aaa_mdsdb.incident_final s
inner join aaa_workdb.dwh_f_incident i on s.sys_id collate utf8_unicode_ci=i.row_id 
and s.sourceinstance = i.source_id
where coalesce(s.u_substate collate utf8_unicode_ci ,' ')<>coalesce(i.substate_src_code_c ,' ')
) c;