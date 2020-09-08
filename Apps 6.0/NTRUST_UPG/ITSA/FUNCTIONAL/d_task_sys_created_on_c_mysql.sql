	
 
 SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.task_final SRC

 JOIN ntrust_mdwdb.d_task TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
where 
CONVERT_TZ (SRC.sys_created_on,'UTC','US/Central')<> TRGT2.sys_created_on_c and SRC.cdctype='X') temp;


