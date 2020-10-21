SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident_ext_c.root_cause_description_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
from png_mdsdb.incident_final SRC 
LEFT JOIN png_mdwdb.d_incident_ext_c TRGT on SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.u_string_3,'UNSPECIFIED') <> TRGT.root_cause_description_c
AND SRC.cdctype='X'

) temp;

 
 
 
 