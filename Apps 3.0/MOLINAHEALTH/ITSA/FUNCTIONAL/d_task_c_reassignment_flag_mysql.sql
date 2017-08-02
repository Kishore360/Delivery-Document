SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from molinahealth_mdwdb.d_task_c stg 
JOIN molinahealth_mdsdb.task_final src ON src.sys_id=stg.row_id 
	AND src.sourceinstance=stg.source_id
where CASE
		   WHEN src.reassignment_count>0 THEN 'Y'
		   ELSE 'N'
	   END<>stg.reassignment_flag)c