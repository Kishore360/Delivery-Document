SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from cardinalhealth_mdsdb.task_final SRC 
join cardinalhealth_mdwdb.d_task_c TRGT 
  on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.row_id
where CASE WHEN SRC.reassignment_count>0 THEN 'Y' ELSE 'N' END<>TRGT.reassignment_flag)ma