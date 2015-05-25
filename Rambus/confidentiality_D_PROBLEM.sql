SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select COUNT(*) AS cnt
 from (
select s.sys_id, s.u_confidentiality,i.row_id, i.confidentiality_c 
from rambus_mdsdb.problem_final s
inner join rambus_workdb.dwh_d_problem i on s.sys_id collate utf8_unicode_ci=i.row_id and 
s.sourceinstance = i.source_id 
)A where  coalesce(u_confidentiality collate utf8_unicode_ci,'N/A')<>coalesce(confidentiality_c,'N/A')

) c;