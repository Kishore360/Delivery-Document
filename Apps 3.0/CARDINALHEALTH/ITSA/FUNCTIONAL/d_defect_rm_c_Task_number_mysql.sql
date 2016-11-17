SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from cardinalhealth_mdsdb.rm_defect_final a
 left  JOIN  cardinalhealth_mdwdb.d_defect_rm_c b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 where  a.number <>b.task_number )b