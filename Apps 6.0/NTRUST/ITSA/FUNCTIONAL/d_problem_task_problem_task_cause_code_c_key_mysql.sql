




SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal.opened_by_service_desk_flag_c' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM   ntrust_mdsdb.problem_task_final SRC
   join ntrust_mdwdb.d_problem_task TRGT
 on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 left JOIN ntrust_mdwdb.d_lov TRGT2 ON
 COALESCE(CONCAT('PROBLEM_TASK_CAUSE_CODE_C~PROBLEM_TASK',UPPER(SRC.cause_code)),'UNSPECIFIED')=TRGT2.row_id
  AND SRC.sourceinstance=TRGT2.source_id
where coalesce(TRGT2.row_key,case when SRC.cause_code is null then 0 else -1 end)
         <> TRGT.problem_task_cause_code_c_key and SRC.cdctype='X' )temp;
		 
