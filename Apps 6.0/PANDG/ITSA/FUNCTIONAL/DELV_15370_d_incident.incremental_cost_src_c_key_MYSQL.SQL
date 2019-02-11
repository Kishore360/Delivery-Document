SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.incremental_cost_src_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM png_mdsdb.incident_final SRC 
LEFT JOIN png_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON CONCAT('INCREMENTAL_COST_C','~','INCIDENT','~',SRC.u_incremental_cost)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE 
COALESCE(LKP.row_key,CASE WHEN SRC.u_incremental_cost IS NULL THEN 0 ELSE -1 END)<>TRGT.incremental_cost_src_c_key
AND SRC.cdctype<>'D'
) temp;



