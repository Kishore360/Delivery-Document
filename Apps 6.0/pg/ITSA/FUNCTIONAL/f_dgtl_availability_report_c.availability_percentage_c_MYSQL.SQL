SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_dgtl_availability_report_c.availability_percentage_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.us_dgtl_availability_report_final SRC 
LEFT JOIN png_mdwdb.f_dgtl_availability_report_c TRGT ON CONCAT( COALESCE(floor(SRC.CI_ID),'UNSPECIFIED'),COALESCE(SRC.START_DATE,'UNSPECIFIED'))=TRGT.row_id
AND SRC.sourceinstance=TRGT.source_id
WHERE ((86400-SRC.TOTAL_DOWN_TIME_ACTUAL)/86400)<>TRGT.availability_percentage_c
AND SRC.cdctype='X'
)temp;




