SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.privacy_irisk_status_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM (
SELECT a.NAME,a.sourceinstance,

CASE WHEN b.MEGA_HEX_ID IS NOT NULL THEN 
IF(SUM(CASE 
WHEN b.Assessment_Status NOT IN ('Complete','Cancelled') THEN 1 
WHEN b.Assessment_Status IN ('Complete','Cancelled') THEN 0 END) > 0 ,'Incomplete','complete')
ELSE 'N/A' END AS Privacy_Risk_Status
FROM png_mdsdb.pg_mega_pgb_application_rita_final a 

LEFT JOIN 
( 
select temp.*,MAX(Submission_Date) as Submission_Date1 from 
(
SELECT x.MEGA_HEX_ID,x.sourceinstance,x.Assessment_Status,x.Submitter,
STR_TO_DATE(x.Submission_Date,'%m/%d/%Y') AS Submission_Date,
STR_TO_DATE(x.Due_Date,'%m/%d/%Y') as Due_Date
FROM png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final x
WHERE x.Submitter IS NOT NULL AND x.Submission_Date IS NOT NULL 
AND x.cdctype='X'

order by STR_TO_DATE(x.Submission_Date,'%m/%d/%Y') DESC
)temp 
group by MEGA_HEX_ID,sourceinstance

UNION ALL 
select temp.*,MAX(Submission_Date) as Submission_Date1 from 
(
SELECT x.MEGA_HEX_ID,x.sourceinstance,x.Assessment_Status,x.Submitter,
STR_TO_DATE(COALESCE(x.Submission_Date,x.Due_Date),'%m/%d/%Y') AS Submission_Date,
STR_TO_DATE(x.Due_Date,'%m/%d/%Y') as Due_Date
FROM png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final x
WHERE x.Submitter IS NOT NULL AND x.Submission_Date IS  NULL 
AND x.cdctype='X'

order by STR_TO_DATE(COALESCE(x.Submission_Date,x.Due_Date),'%m/%d/%Y')DESC
)temp 
group by MEGA_HEX_ID,sourceinstance


) b ON a.NAME=b.MEGA_HEX_ID AND a.sourceinstance=b.sourceinstance
WHERE a.cdctype='X'
group by name,sourceinstance

) SRC 
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON CONCAT('PRIVACY_IRISK_STATUS~MEGA_APPLICATION~',SRC.Privacy_Risk_Status)=LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.Privacy_Risk_Status IS NULL THEN 0 ELSE -1 END)<>TRGT.privacy_irisk_status_c_key
) temp;



 


