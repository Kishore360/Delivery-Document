SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.irisk_id_max_created_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT count(1) as CNT FROM
(SELECT a.mega_hex_id,a.sourceinstance, max(iRisk_ID) as iRisk_ID from  png_mdsdb.pg_mega_application_assessments_infosec_checklists_final a 
JOIN
(SELECT mega_hex_id,sourceinstance,COALESCE(max(STR_to_date(First_Published,'%m/%d/%Y %r')),'1970-01-01') as First_Published from png_mdsdb.pg_mega_application_assessments_infosec_checklists_final
group by 1,2) b 
ON a.mega_hex_id = b.mega_hex_id and a.sourceinstance = b.sourceinstance and  COALESCE(STR_to_date(a.First_Published,'%m/%d/%Y %r'),'1970-01-01') = b.First_Published
group by 1,2 ) S 

LEFT JOIN  png_mdwdb.d_rita_application_ext_c T
ON T.mega_id_c=S.MEGA_HEX_ID 
where T.irisk_id_max_created_c  <> COALESCE(S.iRisk_ID,'UNSPECIFIED')
) temp;





