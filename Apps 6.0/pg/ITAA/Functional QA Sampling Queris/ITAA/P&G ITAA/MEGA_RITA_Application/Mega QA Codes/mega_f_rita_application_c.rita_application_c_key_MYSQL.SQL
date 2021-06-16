



SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.rita_application_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
from pandg_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN pandg_mdwdb.f_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN pandg_mdwdb.d_rita_application_c LKP ON SRC.name=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.NAME IS NULL THEN 0 ELSE -1 END)<>TRGT.rita_application_c_key
) temp;



