SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.infosec_classification' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT
from 
png_mdsdb.pg_mega_cmdb_ci_appl_final SRC
LEFT JOIN png_mdwdb.d_rita_application_c TRGT on (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
WHERE CASE WHEN SRC.u_pg_data_classificaion IN ('High','Medium') THEN 'Highly Restricted' ELSE 'Business Use' END <> TRGT.infosec_classification
AND SRC.cdctype='X'
) temp;


 