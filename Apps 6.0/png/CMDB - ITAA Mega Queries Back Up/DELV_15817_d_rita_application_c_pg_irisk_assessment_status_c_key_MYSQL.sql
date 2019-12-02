SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.pg_irisk_assessment_status_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT b.MEGA_HEX_ID,a.NAME,a.sourceinstance,
CASE 
WHEN b.MEGA_HEX_ID IS NOT NULL 
AND
( 
(CASE WHEN b.MEGA_HEX_ID IS NOT NULL THEN
IF 
(
SUM(CASE 
WHEN b.Assessment_Status NOT IN ('Complete','Cancelled') THEN 1 
WHEN b.Assessment_Status IN ('Complete','Cancelled') THEN 0 END) > 0 , 'Incomplete','Complete')
ELSE 'N/A' END
) IS NOT NULL 
)
AND 
(
(CASE WHEN b.MEGA_HEX_ID IS NOT NULL THEN
IF 
(
SUM(CASE 
WHEN b.Assessment_Status NOT IN ('Complete','Cancelled') THEN 1 
WHEN b.Assessment_Status IN ('Complete','Cancelled') THEN 0 END) > 0 , 'Incomplete','Complete')
ELSE 'N/A' END
)='Complete'
) AND 

(CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Draft','Closed') THEN 1 ELSE NULL END) END IS NULL) OR 
(CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Draft','Closed') THEN 1 ELSE NULL END) END =0) THEN '4' 
WHEN b.MEGA_HEX_ID IS NOT NULL 
AND 
(
(CASE WHEN b.MEGA_HEX_ID IS NOT NULL THEN
IF 
(
SUM(CASE 
WHEN b.Assessment_Status NOT IN ('Complete','Cancelled') THEN 1 
WHEN b.Assessment_Status IN ('Complete','Cancelled') THEN 0 END) > 0 , 'Incomplete','Complete')
ELSE 'N/A' END
)='Complete'
)
AND 
(
CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Draft','Closed') THEN 1 ELSE NULL END) END IS NOT NULL 
)
AND 
(CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Draft','Closed') THEN 1 ELSE NULL END) END <> 'N/A'
)
AND 
(CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Draft','Closed') THEN 1 ELSE NULL END) END <> 0) THEN '5'

WHEN b.MEGA_HEX_ID IS NOT NULL AND 
(
(CASE WHEN b.MEGA_HEX_ID IS NOT NULL THEN
IF 
(
SUM(CASE 
WHEN b.Assessment_Status NOT IN ('Complete','Cancelled') THEN 1 
WHEN b.Assessment_Status IN ('Complete','Cancelled') THEN 0 END) > 0 , 'Incomplete','Complete')
ELSE 'N/A' END
)='Incomplete'
) THEN '6'
WHEN b.MEGA_HEX_ID IS NULL AND 
(SRC2.MEGA_ID IS NOT NULL  AND (SRC2.Status_vs_Baseline='Complete')) THEN '2'
WHEN b.MEGA_HEX_ID IS NULL AND (SRC2.MEGA_ID IS NULL)
AND 
(SRC3.MEGA_ID IS NOT NULL AND (SRC3.CIS_Rough_cut_assessment_done_YesNo='YES' OR SRC3.CIS_Rough_cut_assessment_done_YesNo='Y')) THEN '3'
ELSE '7' END
AS SOURCE_CATEGORY,
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled','Canceled') THEN 1 ELSE 0 END) AS STATUS_COUNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final a 
LEFT JOIN png_mdsdb.pg_mega_irisk_assessment_issues_final b ON a.NAME=b.MEGA_HEX_ID AND a.sourceinstance=b.sourceinstance AND b.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_legacyg1_final SRC2 ON a.NAME=SRC2.MEGA_ID AND a.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_legacyg234_final SRC3 ON a.NAME=SRC3.Mega_ID AND a.sourceinstance=SRC3.sourceinstance AND SRC3.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_excluded_apps_final SRC4 ON a.NAME=SRC4.megaid AND a.sourceinstance=SRC4.sourceinstance AND SRC4.cdctype<>'D'
Where a.cdctype<>'D'
group by b.MEGA_HEX_ID
)SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id 
LEFT JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('IRISK_ASSESSMENT_STATUS~MEGA_APPLICATION~',
CASE WHEN SRC.SOURCE_CATEGORY =4 THEN 'Complete (without open issues)'
WHEN SRC.SOURCE_CATEGORY =5 THEN 'Complete (with open issues)'
WHEN SRC.SOURCE_CATEGORY =6 AND SRC.STATUS_COUNT = 0 THEN 'In Progress (incomplete)'
WHEN SRC.SOURCE_CATEGORY =6 AND SRC.STATUS_COUNT > 0 THEN 'In-Progress (complete/Incomplete)' END),'UNSPECIFIDE')=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE 
COALESCE(LKP.row_key,'')<>TRGT.pg_irisk_assessment_status_c_key
) temp;