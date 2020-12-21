SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.irisk_category_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT b.MEGA_HEX_ID,a.NAME,a.sourceinstance,
CASE WHEN b.MEGA_HEX_ID IS NOT NULL THEN 'Y' ELSE 'N' END AS Exisits_in_iRisk,
CASE WHEN SRC2.MEGA_ID IS NOT NULL  AND (SRC2.Status_vs_Baseline='Complete') THEN 'Y' ELSE 'N' END AS Exisits_in_Legacy1,
CASE WHEN SRC3.MEGA_ID IS NOT NULL AND (SRC3.CIS_Rough_cut_assessment_done_YesNo='YES' OR SRC3.CIS_Rough_cut_assessment_done_YesNo='Y') THEN 'Y' ELSE 'N' END AS Exisits_in_Legacy234,
CASE WHEN SRC4.megaid IS NOT NULL THEN 'Y' ELSE 'N' END as Exists_in_Exclude,
CASE WHEN SUM(CASE WHEN a.NAME=b.MEGA_HEX_ID THEN 1 ELSE 0  END) > 0
THEN 
CASE WHEN 
SUM(CASE WHEN b.MEGA_HEX_ID IS NOT NULL THEN 1 ELSE 0 END) =
SUM(CASE WHEN b.Assessment_Status IN ('Complete','canceled','cancelled') THEN 1 ELSE 0 END) THEN 'Complete'
ELSE 'Incomplete' END
ELSE 'N/A' END AS iRisk_Status,
CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Draft') THEN 1 ELSE NULL END) END AS iRisk_Open_Issues
FROM png_mdsdb.pg_mega_pgb_application_rita_final a 
LEFT JOIN png_mdsdb.pg_mega_irisk_assessment_issues_final b ON a.NAME=b.MEGA_HEX_ID AND a.sourceinstance=b.sourceinstance AND b.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_legacyg1_final SRC2 ON a.NAME=SRC2.MEGA_ID AND a.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_legacyg234_final SRC3 ON a.NAME=SRC3.Mega_ID AND a.sourceinstance=SRC3.sourceinstance AND SRC3.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_excluded_apps_final SRC4 ON a.NAME=SRC4.megaid AND a.sourceinstance=SRC4.sourceinstance AND SRC4.cdctype<>'D'
Where 
b.MEGA_HEX_ID IS NOT NULL 
OR SRC2.MEGA_ID IS NOT NULL
OR SRC3.Mega_ID IS NOT NULL
OR SRC4.megaid IS NOT NULL
AND a.cdctype<>'D'
group by b.MEGA_HEX_ID
) SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(CASE 
WHEN SRC.Exisits_in_iRisk ='Y' AND  (SRC.iRisk_Status IS NOT NULL) AND (SRC.iRisk_Status='Complete') AND (SRC.iRisk_Open_Issues IS NULL OR SRC.iRisk_Open_Issues=0) THEN '4'
WHEN SRC.Exisits_in_iRisk ='Y' AND (SRC.iRisk_Status='Complete')  AND (SRC.iRisk_Open_Issues IS NOT NULL)  AND (SRC.iRisk_Open_Issues<>'N/A') AND (SRC.iRisk_Open_Issues<>0) THEN '5'
WHEN SRC.Exisits_in_iRisk ='Y' AND (SRC.iRisk_Status='Incomplete') THEN '6'
WHEN SRC.Exisits_in_iRisk <>'Y' AND (SRC.Exisits_in_Legacy1='Y') THEN '2'
WHEN SRC.Exisits_in_iRisk <>'Y' AND (SRC.Exisits_in_Legacy1<>'Y') AND (SRC.Exisits_in_Legacy234='Y') THEN '3'
ELSE '7'
END)<>TRGT.irisk_category_c
) temp;


-- 3

WHEN b.MEGA_HEX_ID IS NULL AND (SRC2.MEGA_ID IS NULL)
AND 
(SRC3.MEGA_ID IS NOT NULL AND (SRC3.CIS_Rough_cut_assessment_done_YesNo='YES' OR SRC3.CIS_Rough_cut_assessment_done_YesNo='Y')) THEN '3'

-- 2
WHEN b.MEGA_HEX_ID IS NULL AND 
(SRC2.MEGA_ID IS NOT NULL  AND (SRC2.Status_vs_Baseline='Complete')) THEN '2'


-- 6

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

  --5
 
WHEN b.MEGA_HEX_ID IS NOT NULL 
AND 
(
(CASE WHEN a.MEGA_HEX_ID IS NOT NULL THEN
IF 
(
SUM(CASE 
WHEN a.Assessment_Status NOT IN ('Complete','Cancelled') THEN 1 
WHEN a.Assessment_Status IN ('Complete','Cancelled') THEN 0 END) > 0 , 'Incomplete','Complete')
ELSE 'N/A' END
)='Complete'
)
AND 
(
CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Draft') THEN 1 ELSE NULL END) END IS NOT NULL 
)
AND 
(CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Draft') THEN 1 ELSE NULL END) END <> 'N/A'
)
AND 
(CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Draft') THEN 1 ELSE NULL END) END <> 0) THEN '5'
 
--- '4'
CASE 
WHEN b.MEGA_HEX_ID IS NOT NULL 
AND
( 
(CASE WHEN a.MEGA_HEX_ID IS NOT NULL THEN
IF 
(
SUM(CASE 
WHEN a.Assessment_Status NOT IN ('Complete','Cancelled') THEN 1 
WHEN a.Assessment_Status IN ('Complete','Cancelled') THEN 0 END) > 0 , 'Incomplete','Complete')
ELSE 'N/A' END
) IS NOT NULL 
)
AND 
(
(CASE WHEN a.MEGA_HEX_ID IS NOT NULL THEN
IF 
(
SUM(CASE 
WHEN a.Assessment_Status NOT IN ('Complete','Cancelled') THEN 1 
WHEN a.Assessment_Status IN ('Complete','Cancelled') THEN 0 END) > 0 , 'Incomplete','Complete')
ELSE 'N/A' END
)='Complete'
) AND 

(CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Draft') THEN 1 ELSE NULL END) END IS NULL) OR 
(CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Draft') THEN 1 ELSE NULL END) END =0) THEN '4' ELSE '0' END
AS CATEGORY


