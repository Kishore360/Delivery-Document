
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_ops_svc_vms_c.updated_date_c' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM wpl_mdsdb.us_osvw_patching_dashboardnumerify_final SRC 
LEFT JOIN wpl_mdwdb.d_ops_svc_vms_c TRGT ON SRC.row_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
WHERE SRC.updated<>TRGT.updated_date_c and SRC.cdctype='X')ma;



 