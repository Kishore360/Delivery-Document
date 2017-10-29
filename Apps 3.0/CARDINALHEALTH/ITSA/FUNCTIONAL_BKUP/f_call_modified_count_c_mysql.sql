 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.new_call_final a
JOIN  cardinalhealth_mdwdb.f_call b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
Where a.sys_mod_count <> b.modified_count_c)c