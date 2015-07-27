SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select COUNT(*) AS cnt
from (
select s.sys_id, s.u_issue_type,i.row_id, i.issue_type_c 
from rambus_mdsdb.change_request_final s
inner join rambus_workdb.dwh_d_change_request i on s.sys_id collate utf8_unicode_ci=i.row_id and 
s.sourceinstance = i.source_id 
)A where  coalesce(u_issue_type collate utf8_unicode_ci,' ')<>coalesce(issue_type_c,' ')

) c;