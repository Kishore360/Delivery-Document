

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.irisk_status_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN 
(
SELECT a.MEGA_HEX_ID,a.Assessment_Status,a.sourceinstance,
(CASE WHEN a.MEGA_HEX_ID IS NOT NULL THEN
IF 
(
SUM(CASE 
WHEN a.Assessment_Status NOT IN ('Complete','Cancelled') THEN 1 
WHEN a.Assessment_Status IN ('Complete','Cancelled') THEN 0 END) > 0 , 'Incomplete','Complete')
ELSE 'N/A' END
) AS iRisk_Status
FROM png_mdsdb.pg_mega_irisk_assessment_issues_final a where a.cdctype<>'D'
GROUP BY 1
) SRC1 ON SRC.NAME=SRC1.MEGA_HEX_ID AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE SRC1.iRisk_Status<>TRGT.irisk_status_c
AND SRC.cdctype<>'D' 
) temp;



 
 
