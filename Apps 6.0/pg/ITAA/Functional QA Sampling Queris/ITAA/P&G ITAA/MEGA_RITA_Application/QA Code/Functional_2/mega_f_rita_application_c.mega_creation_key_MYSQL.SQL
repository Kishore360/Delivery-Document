

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.mega_creation_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
from pandg_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN pandg_mdwdb.f_rita_application_c TRGT ON (SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN pandg_mdwdb.d_calendar_date LKP ON DATE_FORMAT(substring(replace(SRC.CREATIONDATE,' ',''),1,14),'%Y%m%d')=LKP.row_id AND LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.CREATIONDATE IS NULL THEN 0 ELSE -1 END)<>TRGT.mega_creation_key

) temp;





