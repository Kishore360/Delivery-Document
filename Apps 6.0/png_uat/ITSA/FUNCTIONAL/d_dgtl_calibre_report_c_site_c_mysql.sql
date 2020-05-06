SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_calibre_report_c.site_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.us_dgtl_website_data_snapshot_final SRC 
LEFT JOIN png_mdwdb.d_dgtl_calibre_report_c TRGT 
ON concat ( COALESCE(site,'UNSPECIFIED'), '~',
COALESCE(MetricsSnapshotsCreatedAt,'UNSPECIFIED'), '~',COALESCE(MetricName,'UNSPECIFIED'),
 '~',COALESCE(TestProfileIsMobile,'UNSPECIFIED') )=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  site <>TRGT.site_c
AND SRC.cdctype='X'
) temp;

