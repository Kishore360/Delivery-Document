SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.quantitative_description_c' ELSE 'SUCCESS' END as Message
FROM
(
Select Count(1) as CNT 
from png_mdsdb.incident_final SRC 
LEFT JOIN png_mdwdb.d_incident TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE (SRC.u_quantitative_description)<>TRGT.quantitative_description_c
) temp;



