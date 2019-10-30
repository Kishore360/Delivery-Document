SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.dormant_flag' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
ntrs_mdsdb.u_problem_task_final SRC
join
ntrs_mdwdb.d_problem_task TRGT
on (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
where
TRGT.dormant_flag<>(
CASE 
WHEN timestampdiff(DAY,
CONVERT_TZ(TRGT.changed_on,'US/Central','GMT'),
CONVERT_TZ((SELECT max(lastupdated) FROM ntrs_mdwdb.d_o_data_freshness WHERE TRGT.source_id=d_o_data_freshness.source_id and CONSUMER_ID = 3),'US/Central','GMT')) > 30 THEN 'Y' 
ELSE 'N' end)
and SRC.cdctype='X') temp;
