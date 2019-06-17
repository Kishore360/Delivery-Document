SELECT Count(1) as CNT 
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
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON Z.NAME=TRGT.row_id AND Z.sourceinstance=TRGT.source_id
WHERE COALESCE(Y.Submitter,'UNSPECIFIED')<>TRGT.privacy_Submitter_c
;
