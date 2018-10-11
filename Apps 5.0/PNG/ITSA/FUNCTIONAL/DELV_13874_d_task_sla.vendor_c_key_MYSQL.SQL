


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task_sla.vendor_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
from png_mdsdb.contract_sla_final src
LEFT JOIN png_mdwdb.d_task_sla trgt ON (src.sys_id=trgt.row_id AND src.sourceinstance=trgt.source_id)
JOIN png_mdwdb.d_internal_organization lkp ON CONCAT('GROUP~',src.vendor)=lkp.row_id AND src.sourceinstance=lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.vendor IS NULL THEN 0 ELSE -1 END)<>trgt.vendor_c_key
) temp; 


