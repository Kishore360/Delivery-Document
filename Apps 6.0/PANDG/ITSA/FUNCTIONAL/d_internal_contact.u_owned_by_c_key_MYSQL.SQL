SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.u_owned_by_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) AS CNT
FROM png_mdsdb.contract_sla_final a
LEFT JOIN png_mdwdb.d_task_sla b ON a.sys_id=b.row_id AND a.sourceinstance=b.source_id
JOIN png_mdwdb.d_internal_contact LKP ON CONCAT('INTERNAL_CONTACT~',a.u_owned_by)=LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN a.u_owned_by IS NULL THEN 0 ELSE -1 END)<>b.u_owned_by_c_key
AND a.cdctype='X'
) temp;



