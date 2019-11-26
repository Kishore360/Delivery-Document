SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_performance_targets_set_c.opened_all' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.us_png_performance_targets_c_final SRC 
LEFT JOIN png_mdwdb.d_performance_targets_set_c TRGT ON SRC.quarter_name=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.opened_all,'UNSPECIFIED')<>TRGT.opened_all
AND SRC.cdctype='X'
) temp;


