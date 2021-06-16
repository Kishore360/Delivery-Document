SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.irisk_assessment_status_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT FROM 
(
SELECT a.mega_hex_id,a.sourceinstance,
max(iRisk_ID) as iRisk_ID from  png_mdsdb.pg_mega_application_assessments_infosec_checklists_final a 
JOIN
(SELECT mega_hex_id,sourceinstance,COALESCE(max(STR_to_date(First_Published,'%m/%d/%Y %r')),'1970-01-01') as First_Published from png_mdsdb.pg_mega_application_assessments_infosec_checklists_final
group by 1,2) b 
ON a.mega_hex_id = b.mega_hex_id and a.sourceinstance = b.sourceinstance and  COALESCE(STR_to_date(a.First_Published,'%m/%d/%Y %r'),'1970-01-01') 
= b.First_Published
group by 1,2
 ) S
LEFT JOIN png_mdsdb.pg_mega_application_assessments_infosec_checklists_final ch ON S.iRisk_ID=ch.iRisk_ID
LEFT JOIN png_mdwdb.d_lov c 
ON c.row_id = CONCAT('ASSESSMENT_STATUS~MEGA_APPLICATION~',ch.Assessment_Status) and c.source_id = ch.sourceinstance
LEFT JOIN  png_mdwdb.d_rita_application_ext_c T
ON S.mega_hex_id=T.mega_id_c 
WHERE COALESCE(c.row_key,CASE WHEN ch.Assessment_Status IS NULL THEN 0 ELSE -1 END )<>T.irisk_assessment_status_c_key
) temp; 


