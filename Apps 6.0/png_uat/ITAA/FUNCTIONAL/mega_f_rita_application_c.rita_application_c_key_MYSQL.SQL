



SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.rita_application_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
from png_mdsdb.pg_mega_cmdb_ci_appl_final SRC
LEFT JOIN png_mdwdb.f_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_rita_application_c LKP ON SRC.sys_id=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.sys_id IS NULL THEN 0 ELSE -1 END)<>TRGT.rita_application_c_key
) temp;



