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
join
ntrs_mdwdb.f_problem_task TRGT1
on (SRC.sys_id=TRGT1.row_id and SRC.sourceinstance=TRGT1.source_id)
 JOIN ntrs_mdwdb.d_lov_map dlm ON TRGT1.state_src_key = dlm.src_key and TRGT1.source_id = dlm.source_id
where
TRGT.dormant_flag<>(CASE 
WHEN timestampdiff(DAY,TRGT.changed_on,(SELECT max(lastupdated) FROM ntrs_mdwdb.d_o_data_freshness 
WHERE d_o_data_freshness.source_id =SRC.sourceinstance)) > 30 THEN 'Y' 
ELSE 'N' end)  AND dlm.dimension_class = 'STATE~PROBLEM_TASK'
  AND dlm.dimension_wh_code in ('OPEN')
and SRC.cdctype='X' ) temp;
