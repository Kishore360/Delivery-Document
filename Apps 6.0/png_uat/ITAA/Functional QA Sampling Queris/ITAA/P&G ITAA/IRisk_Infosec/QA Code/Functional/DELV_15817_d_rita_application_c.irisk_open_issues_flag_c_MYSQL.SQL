
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.irisk_open_issues_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT b.MEGA_HEX_ID,a.NAME,a.sourceinstance,

CASE WHEN (b.MEGA_HEX_ID IS NULL) OR 
(
(
CASE WHEN SUM(CASE WHEN a.NAME=b.MEGA_HEX_ID THEN 1 ELSE 0  END) > 0
THEN 
CASE WHEN 
SUM(CASE WHEN b.MEGA_HEX_ID IS NOT NULL THEN 1 ELSE 0 END) =
SUM(CASE WHEN b.Assessment_Status IN ('Complete','canceled','cancelled') THEN 1 ELSE 0 END) THEN 'Complete'
ELSE 'Incomplete' END
ELSE 'N/A' END 
)='Incomplete') THEN 'N/A'
WHEN 
(
CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Draft') THEN 1 ELSE NULL END) END) > 0 THEN 'Y' ELSE 'N' END AS iRisk_Open_Issues_flag
FROM png_mdsdb.pg_mega_pgb_application_rita_final a 
LEFT JOIN png_mdsdb.pg_mega_irisk_assessment_issues_final b ON a.NAME=b.MEGA_HEX_ID AND a.sourceinstance=b.sourceinstance AND b.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_legacyg1_final SRC2 ON a.NAME=SRC2.MEGA_ID AND a.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_legacyg234_final SRC3 ON a.NAME=SRC3.Mega_ID AND a.sourceinstance=SRC3.sourceinstance AND SRC3.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_excluded_apps_final SRC4 ON a.NAME=SRC4.megaid AND a.sourceinstance=SRC4.sourceinstance AND SRC4.cdctype<>'D'
Where b.MEGA_HEX_ID IS NOT NULL
AND a.cdctype<>'D' 
group by b.MEGA_HEX_ID
) SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE (CASE WHEN SRC.iRisk_Open_Issues_flag ='Y' THEN 'Y' ELSE 'N' END)<>TRGT.irisk_open_issues_flag_c

) temp;



