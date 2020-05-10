SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_performance_targets_set_c.resolved_p1_met_sla' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.us_png_performance_targets_c_final SRC 
LEFT JOIN png_mdwdb.d_performance_targets_set_c TRGT ON SRC.quarter_name=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.resolved_p1_met_sla,'UNSPECIFIED')<>TRGT.resolved_p1_met_sla
AND SRC.cdctype='X'
) temp;


 