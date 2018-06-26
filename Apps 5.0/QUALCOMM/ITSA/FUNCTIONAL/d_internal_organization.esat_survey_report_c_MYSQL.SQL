


SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.esat_survey_report_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT
FROM qualcomm_mdsdb.sys_user_group_final SRC
LEFT JOIN qualcomm_mdwdb.d_internal_organization TRGT 
ON CONCAT('GROUP~',SRC.sys_id)=TRGT.row_id AND SRC.sourceinstance AND TRGT.source_id 
Where (CASE WHEN SRC.u_esat_survey_report IS TRUE THEN 'Y' ELSE 'N' END)<>TRGT.esat_survey_report_c
AND TRGT.soft_deleted_flag='N'
) temp;



