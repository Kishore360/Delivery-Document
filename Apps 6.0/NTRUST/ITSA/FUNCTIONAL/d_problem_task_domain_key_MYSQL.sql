SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.domain_key' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
ntrs_mdsdb.u_problem_task_final SRC
join
ntrs_mdwdb.d_problem_task TRGT
on (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
join
ntrs_mdwdb.d_domain LKP
on (COALESCE(SRC.sys_domain,'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.source_id)
where COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 ELSE -1 END)<>TRGT.domain_key
and SRC.cdctype='X') temp;