SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_assessment_master_c.name_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.assessment_master_final SRC
LEFT JOIN png_mdwdb.d_assessment_master_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.name,'UNSPECIFIED')<>TRGT.name_c
AND SRC.cdctype='X'
) temp;


