
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for incident_final.reopened_c_flag' ELSE 'SUCCESS' END as  Message
FROM 
(
SELECT count(1) as CNT  
FROM nbcu_mdsdb.nbcu_mdsdb.incident_final src 
LEFT JOIN nbcu_mdwdb.d_task trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE (CASE WHEN src.reopen_count>0 THEN 'Y' ELSE 'N' END) <> (trgt.reopened_c_flag)
)temp;

