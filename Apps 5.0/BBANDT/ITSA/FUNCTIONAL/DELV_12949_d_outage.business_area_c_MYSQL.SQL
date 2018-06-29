

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.failure_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT 
FROM bbandt_mdsdb.cmdb_ci_outage_final SRC 
LEFT JOIN bbandt_mdwdb.d_outage TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.u_business_area,'UNSPECIFIED')<>TRGT.business_area_c
) temp; 



