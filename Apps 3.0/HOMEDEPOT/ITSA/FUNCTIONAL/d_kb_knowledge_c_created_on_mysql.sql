   SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from homedepot_mdsdb.kb_knowledge_final a
  JOIN   homedepot_mdwdb.d_kb_knowledge_c b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
 where CONVERT_TZ(a.sys_created_on,'GMT','America/New_York') <> b.created_on) temp;
 
 
 