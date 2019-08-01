SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.incident_unit_of_measure_c_key' ELSE 'SUCCESS' END as Message
FROM
(
Select Count(1) as CNT 
from png_mdsdb.incident_final SRC 
LEFT JOIN png_mdwdb.d_incident TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN png_mdwdb.d_lov LKP ON COALESCE(CONCAT('UNIT_MEASURE','~','INCIDENT','~',SRC.u_unit_of_measure),'UNSPECIFIED')=LKP.row_id
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_unit_of_measure IS NULL THEN 0 ELSE -1 END)<>TRGT.incident_unit_of_measure_c_key
AND SRC.cdctype='X'
) temp;


