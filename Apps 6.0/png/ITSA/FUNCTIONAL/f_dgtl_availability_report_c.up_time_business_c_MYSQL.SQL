SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_dgtl_availability_report_c.up_time_business_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.us_dgtl_availability_report_final SRC 
LEFT JOIN png_mdwdb.f_dgtl_availability_report_c TRGT ON CONCAT( COALESCE(floor(SRC.CI_ID),'UNSPECIFIED'),COALESCE(SRC.START_DATE,'UNSPECIFIED'))=TRGT.row_id
AND SRC.sourceinstance=TRGT.source_id
WHERE UP_TIME_BUSINESS<>TRGT.up_time_business_c
AND SRC.cdctype='X'
)temp;



 
   