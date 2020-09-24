
SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_task.change_task_operational_tier_3_c_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM   ntrust_mdsdb.change_task_final SRC
   join ntrust_mdwdb.d_change_task TRGT
 on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 left JOIN ntrust_mdwdb.d_lov TRGT2 ON
 COALESCE(CONCAT('OPERATIONAL_TIER_3_C~CHANGE_TASK~',UPPER(SRC.u_operational_tier_3)),'UNSPECIFIED')=TRGT2.row_id
  AND SRC.sourceinstance=TRGT2.source_id
where coalesce(TRGT2.row_key,case when SRC.u_operational_tier_3 is null then 0 else -1 end)
         <> TRGT.change_task_operational_tier_3_c_key
 and SRC.cdctype='X' )temp;