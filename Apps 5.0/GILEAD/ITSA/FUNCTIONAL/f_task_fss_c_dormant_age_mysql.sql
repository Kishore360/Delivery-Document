SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from (
SELECT COUNT(1) AS CNT
FROM gilead_mdsdb.u_task_fss_final SRC 
  JOIN gilead_mdwdb.f_task_fss_c TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
JOIN gilead_mdwdb.d_task_fss_c d ON (d.row_id =TRGT.row_id  AND d.source_id= TRGT.source_id )
LEFT JOIN gilead_mdwdb.d_lov_map lm  ON (lm.src_key = d.state_c_key)
where lm.dimension_class = 'STATE_C~TASK_FSS_C' AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(DATEDIFF((SELECT MAX(lastupdated) AS lastupdated
FROM gilead_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),
CONVERT_TZ(SRC.sys_updated_on,'GMT','America/New_York')),0)<> TRGT.dormant_age) a;