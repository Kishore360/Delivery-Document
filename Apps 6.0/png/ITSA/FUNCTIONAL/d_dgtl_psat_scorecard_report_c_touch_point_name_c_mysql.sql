SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_psat_scorecard_report_c.touch_point_name_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM   png_mdsdb.u_pg_cs_scanning_final SRC 
LEFT JOIN  png_mdsdb.cmdb_ci_web_site_final  SRC1 ON SRC.u_touchpoint_name=SRC1.sys_id  AND SRC.sourceinstance=SRC1.sourceinstance and SRC1.cdctype='X'
LEFT JOIN png_mdwdb.d_dgtl_psat_scorecard_report_c TRGT 
ON SRC.Sys_id = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE SRC1.name <> TRGT.touch_point_name_c
AND SRC.cdctype<>'D'
) temp;


/* SELECT Count(1) as CNT 
FROM png_mdsdb.u_pg_cs_scanning_final SRC                  
LEFT OUTER JOIN png_mdsdb.cmdb_ci_web_site_final SRC1  ON SRC.u_touchpoint_name=SRC1.sys_id  AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
JOIN 
(
SELECT
u_pg_cs_scanning.sourceinstance AS source_id,
u_pg_cs_scanning.sys_id AS row_id,
u_pg_cs_scanning.cdctype AS cdctype,
MAX(u_pg_cs_scanning.u_finish_date) AS u_finish_date,
u_pg_cs_scanning.u_scan_type AS u_scan_type,
u_pg_cs_scanning.u_touchpoint_name AS u_touchpoint_name        
FROM
png_mdsdb.u_pg_cs_scanning_final u_pg_cs_scanning         
WHERE 1=1 
group by u_pg_cs_scanning.u_touchpoint_name,u_pg_cs_scanning.u_scan_type
) SRC2 ON SRC.u_touchpoint_name=SRC2.u_touchpoint_name  AND SRC.u_scan_type=SRC2.u_scan_type  AND SRC.u_finish_date=SRC2.u_finish_date 
LEFT JOIN png_mdwdb.d_dgtl_psat_scorecard_report_c TRGT 
ON SRC.Sys_id = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE SRC1.name <> TRGT.touch_point_name_c
AND SRC.cdctype='X'; */