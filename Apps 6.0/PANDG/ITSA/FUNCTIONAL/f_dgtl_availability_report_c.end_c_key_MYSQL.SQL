SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_dgtl_availability_report_c.end_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.us_dgtl_availability_report_final SRC 
LEFT JOIN png_mdwdb.f_dgtl_availability_report_c TRGT ON CONCAT( COALESCE(floor(SRC.CI_ID),'UNSPECIFIED'),COALESCE(SRC.START_DATE,'UNSPECIFIED'))=TRGT.row_id
AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_calendar_date LKP ON COALESCE(DATE_FORMAT((SRC.END_DATE), '%Y%m%d'),'UNSPECIFIED')=LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.END_DATE IS NULL THEN 0 ELSE -1 END)<>TRGT.end_c_key
AND SRC.cdctype='X'
)temp;



 
