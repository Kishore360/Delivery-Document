SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.irisk_open_issues_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT b.MEGA_HEX_ID,a.NAME,a.sourceinstance,CASE WHEN b.MEGA_HEX_ID iS NOT NULL THEN  
SUM(CASE WHEN b.Assessment_Status IN ('Complete','Cancelled') 
AND ((b.Issues_ID IS NOT NULL) OR (b.Issues_ID <> ''))
AND b.Overall_Status NOT IN ('Complete','Closed','Draft') THEN 1 ELSE NULL END) END AS iRisk_Open_Issues
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final a 
LEFT JOIN png_mdsdb.pg_mega_irisk_assessment_issues_final b ON a.NAME=b.MEGA_HEX_ID AND a.sourceinstance=b.sourceinstance AND b.cdctype='X'
Where a.cdctype='X'
group by b.MEGA_HEX_ID
) SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.iRisk_Open_Issues,'N/A')<>TRGT.irisk_open_issues_c
) temp;



 
 

 