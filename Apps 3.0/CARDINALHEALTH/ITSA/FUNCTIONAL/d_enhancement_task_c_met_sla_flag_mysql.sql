 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from cardinalhealth_mdsdb.u_enhancement_task_final a
   JOIN    cardinalhealth_mdwdb.d_enhancement_task_c b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
 where case when made_sla = true then 'Y' else 'N' end <> b.met_sla_flag) temp;
 
 
 