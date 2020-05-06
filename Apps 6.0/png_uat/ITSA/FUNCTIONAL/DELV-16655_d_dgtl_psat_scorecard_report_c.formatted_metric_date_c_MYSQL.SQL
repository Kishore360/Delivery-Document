SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_psat_scorecard_report_c.formatted_metric_date_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM 
(SELECT a.Touchpoint_Number,a.FileDate,a.sourceinstance,
CAST(date_add(cast(a.FileDate AS datetime),INTERVAL -3 DAY) AS DATE) AS formatted_metric_date_c
FROM png_mdsdb.us_dgtl_psat_scorecard_report_final a Where cdctype='X' 
)SRC 
LEFT JOIN png_mdwdb.d_dgtl_psat_scorecard_report_c TRGT ON 
CONCAT( COALESCE(floor(SRC.Touchpoint_Number),'UNSPECIFIED'),COALESCE(SRC.FileDate,'UNSPECIFIED'))=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
SRC.formatted_metric_date_c<>TRGT.formatted_metric_date_c
) temp;



 
 
