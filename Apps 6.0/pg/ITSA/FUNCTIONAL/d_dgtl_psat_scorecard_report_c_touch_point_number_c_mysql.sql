SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_psat_scorecard_report_c.touch_point_number_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM   png_mdsdb.u_pg_cs_scanning_final SRC 
JOIN   png_mdsdb.cmdb_ci_web_site_final  SRC1
ON    SRC.u_touchpoint_name=SRC1.sys_id  
LEFT JOIN png_mdwdb.d_dgtl_psat_scorecard_report_c TRGT 
ON SRC.Sys_id = TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id

WHERE SRC1.pid <> TRGT.touch_point_number_c
AND SRC.cdctype<>'D'
) temp;


