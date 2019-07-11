SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_availability_report_c.ci_id_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.us_dgtl_availability_report_final SRC 
LEFT JOIN png_mdwdb.d_dgtl_availability_report_c TRGT ON 
CONCAT(COALESCE(floor(SRC.CI_ID),'UNSPECIIFED'),COALESCE(SRC.START_DATE,'UNSPECIFIED'))=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE FLOOR(SRC.CI_ID)<>TRGT.ci_id_c
AND SRC.cdctype='X'
) temp;


