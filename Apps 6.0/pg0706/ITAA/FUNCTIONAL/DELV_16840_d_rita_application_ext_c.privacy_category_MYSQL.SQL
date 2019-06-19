
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.privacy_category' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT
Count(1) as CNT 
FROM 
(
SELECT Z.NAME,Z.sourceinstance,
CASE WHEN Y.MEGA_HEX_ID IS NOT NULL THEN 
IF(SUM(CASE 
WHEN Y.Assessment_Status NOT IN ('Complete','Cancelled') THEN 1 
WHEN Y.Assessment_Status IN ('Complete','Cancelled') THEN 0 END) > 0 ,'Incomplete','complete')
ELSE 'N/A' END AS Privacy_Risk_Status
FROM png_mdsdb.pg_mega_pgb_application_rita_final Z 

LEFT JOIN 
(
select A.*,MAX(COALESCE(Submission_Date,Due_Date)) AS MAX_Date1 from 
(
SELECT X.MEGA_HEX_ID,X.sourceinstance,X.Submitter,
STR_TO_DATE(X.Submission_Date,'%m/%d/%Y') AS Submission_Date,X.Due_Date,X.PRV_0018,X.Assessment_Status,X.Assessment_Name
FROM 
(
(
Select a.MEGA_HEX_ID,a.sourceinstance,a.Submitter,STR_TO_DATE(a.Submission_Date,'%m/%d/%Y') AS Submission_Date,STR_TO_DATE(a.Due_Date,'%m/%d/%Y') AS Due_Date,a.PRV_0018,a.Assessment_Status,a.Assessment_Name
FROM png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final a 
WHERE a.Submitter IS NOT NULL and a.Submission_Date IS NOT NULL
AND MEGA_HEX_ID IN ( SELECT DISTINCT MEGA_HEX_ID from png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final
where cdctype ='X'
group by MEGA_HEX_ID
having COUNT( DISTINCT MEGA_HEX_ID)=1)
AND cdctype ='X'
Order by STR_TO_DATE(a.Submission_Date,'%m/%d/%Y') desc 
)
UNION 
(
Select a.MEGA_HEX_ID,a.sourceinstance,a.Submitter,STR_TO_DATE(a.Submission_Date,'%m/%d/%Y') AS Submission_Date,STR_TO_DATE(a.Due_Date,'%m/%d/%Y') AS Due_Date,a.PRV_0018,a.Assessment_Status,a.Assessment_Name
FROM png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final a 
WHERE a.Submitter IS NOT NULL and a.Submission_Date IS NOT NULL
AND MEGA_HEX_ID IN ( select DISTINCT MEGA_HEX_ID from png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final
where cdctype ='X'
group by MEGA_HEX_ID
having COUNT(MEGA_HEX_ID)>1)
AND cdctype ='X'
Order by STR_TO_DATE(a.Submission_Date,'%m/%d/%Y') desc 
)
UNION 
(
Select a.MEGA_HEX_ID,a.sourceinstance,a.Submitter,STR_TO_DATE(a.Submission_Date,'%m/%d/%Y') AS Submission_Date,STR_TO_DATE(a.Due_Date,'%m/%d/%Y') AS Due_Date,a.PRV_0018,a.Assessment_Status,a.Assessment_Name
FROM png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final a 
WHERE a.Submitter IS NOT NULL and a.Submission_Date IS NULL
AND MEGA_HEX_ID IN ( SELECT DISTINCT MEGA_HEX_ID from png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final
where cdctype ='X'
group by MEGA_HEX_ID
having COUNT(MEGA_HEX_ID)=1)
AND cdctype ='X'
Order by STR_TO_DATE(a.Submission_Date,'%m/%d/%Y') desc 
)
UNION 
(
Select a.MEGA_HEX_ID,
a.sourceinstance,a.Submitter,STR_TO_DATE(a.Submission_Date,'%m/%d/%Y') AS Submission_Date,STR_TO_DATE(a.Due_Date,'%m/%d/%Y') AS Due_Date,a.PRV_0018,a.Assessment_Status,a.Assessment_Name
FROM png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final a 
WHERE a.Submitter IS NOT NULL and a.Submission_Date IS NULL
AND MEGA_HEX_ID IN ( select DISTINCT MEGA_HEX_ID from png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final
where cdctype ='X'
group by MEGA_HEX_ID
having COUNT(MEGA_HEX_ID)>1)
AND cdctype ='X'
Order by STR_TO_DATE(a.Submission_Date,'%m/%d/%Y') desc 
)
) X 
ORDER BY COALESCE(X.Submission_Date,X.Due_Date) DESC
)A 
group by MEGA_HEX_ID,sourceinstance 
) Y ON Z.NAME=Y.MEGA_HEX_ID AND Z.sourceinstance=Y.sourceinstance
GROUP BY Z.NAME,Z.sourceinstance
) SRC 
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(
CASE 
WHEN TRGT.privacy_exists_in_irisk_flag_c='Y' AND SRC.Privacy_Risk_Status='Complete' THEN '2'
WHEN TRGT.privacy_exists_in_legacy_flag_c='Y' THEN '1'
WHEN TRGT.privacy_exists_in_irisk_legacy_flag_c='Y' THEN '5'
WHEN TRGT.privacy_exists_in_irisk_flag_c='Y' AND SRC.Privacy_Risk_Status<>'Complete' THEN '3'
ELSE '4'
END )<>TRGT.privacy_category
) temp;


