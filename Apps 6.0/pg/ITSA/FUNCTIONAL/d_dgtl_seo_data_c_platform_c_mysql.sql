SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_seo_data_c.platform_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.us_dgtl_seodata_c_final SRC 
LEFT JOIN png_mdwdb.d_dgtl_seo_data_c TRGT 
ON concat ( COALESCE(floor(SRC.TP_ID),'UNSPECIFIED'),  COALESCE(SRC.DeepCrawl_Last_Scan,'UNSPECIFIED') )
=
TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE SRC.Platform <> TRGT.platform_c
and SRC.TP_ID <> 0
AND SRC.cdctype<>'D'
) temp;


