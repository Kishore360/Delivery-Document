SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.rm_defect_final a
JOIN  cardinalhealth_mdwdb.f_defect_rm_c b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
Where a.impact<> b.impact_src_code)c

