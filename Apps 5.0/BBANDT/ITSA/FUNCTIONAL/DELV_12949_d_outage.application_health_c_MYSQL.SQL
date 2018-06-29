

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_outage.application_health_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT 
FROM bbandt_mdsdb.cmdb_ci_outage_final SRC 
LEFT JOIN bbandt_mdwdb.d_outage TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.u_application_health,'UNSPECIFIED')<>TRGT.application_health_c
AND TRGT.soft_deleted_flag='N'
) temp; 





