-- if query is failed might be due to ORDEREING issues 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.irisk_id_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC
LEFT JOIN 
(
SELECT Y.MEGA_HEX_ID,Y.sourceinstance,GROUP_CONCAT(Distinct Y.iRisk_ID ORDER BY iRisk_ID) AS iRisk_ID1
FROM 
(
SELECT a.*
FROM 
(
SELECT a.*,
COALESCE(a.Helper_Name_of_Checklist_1,Helper_Name_of_Checklist_2,Helper_Name_of_Checklist_3) as common_check_list ,
STR_TO_DATE( COALESCE(a.Last_Updated_1,a.Last_Updated_2,a.Last_Updated_3), '%m/%d/%Y %h:%i:%s %p')as common_last_update
FROM png_mdsdb.pg_mega_application_assessments_infosec_checklists_final a where a.cdctype='X'
) a 
JOIN 
(
SELECT a.MEGA_HEX_ID,
Helper_Name_of_Checklist_1  as helper_name_of_checklist, 
max(STR_TO_DATE(Last_Updated_1, '%m/%d/%Y %h:%i:%s %p')) as last_updated 
FROM png_mdsdb.pg_mega_application_assessments_infosec_checklists_final a 
JOIN (SELECT distinct MEGA_HEX_ID from png_mdsdb.pg_mega_application_assessments_infosec_checklists_final) b
ON a.MEGA_HEX_ID = b.MEGA_HEX_ID where Helper_Name_of_Checklist_1 ='Application Security Controls Checklist'
group by 1,2
UNION
SELECT a.MEGA_HEX_ID,
Helper_Name_of_Checklist_2 , 
max(STR_TO_DATE(Last_Updated_2, '%m/%d/%Y %h:%i:%s %p'))as last_updated 
FROM png_mdsdb.pg_mega_application_assessments_infosec_checklists_final a 
JOIN (SELECT distinct MEGA_HEX_ID from png_mdsdb.pg_mega_application_assessments_infosec_checklists_final) b
ON a.MEGA_HEX_ID = b.MEGA_HEX_ID where Helper_Name_of_Checklist_2 ='Network Security Controls Checklist'
group by 1,2
UNION
SELECT a.MEGA_HEX_ID,
Helper_Name_of_Checklist_3, 
max(STR_TO_DATE(Last_Updated_3, '%m/%d/%Y %h:%i:%s %p')) as last_updated 
FROM png_mdsdb.pg_mega_application_assessments_infosec_checklists_final a 
JOIN (SELECT distinct MEGA_HEX_ID from png_mdsdb.pg_mega_application_assessments_infosec_checklists_final) b
ON a.MEGA_HEX_ID = b.MEGA_HEX_ID where Helper_Name_of_Checklist_3 ='System Security Controls Checklist'
group by 1,2 
)b 
 ON a.MEGA_HEX_ID = b.MEGA_HEX_ID and a.common_last_update = b.last_updated 
 and common_check_list = helper_name_of_checklist
 ) Y
 Group by 1,2
) SRC1 ON SRC.NAME=SRC1.MEGA_HEX_ID AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.iRisk_ID1,'UNSPECIFIED')<>TRGT.irisk_id_c COLLATE utf8_unicode_ci
AND SRC.cdctype='X'
) temp


