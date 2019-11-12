SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_psat_scorecard_report_c.tags_finished_date_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.u_pg_cs_scanning_final SRC 
LEFT JOIN pgdyna_mdwdb.d_dgtl_psat_scorecard_report_c TRGT 
ON SRC.Sys_id = TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id
WHERE CASE WHEN u_scan_type= 'Tags' THEN SRC.u_finish_date END  <> TRGT.tags_finished_date_c
AND SRC.cdctype<>'D'
) temp;

