-- Source Union Query 

Select 'pg_mega_irisk_assessment_issues_final', Count(distinct MEGA_HEX_ID) 
from png_mdsdb.pg_mega_irisk_assessment_issues_final a 
Inner JOIN png_mdsdb.pg_mega_pgb_application_rita_final  b ON a.MEGA_HEX_ID=b.NAME AND a.sourceinstance=b.sourceinstance AND a.cdctype<>'D'
where b.cdctype<>'D' group by 1
UNION
Select 'pg_mega_application_assessments_infosec_checklists_final', Count(distinct MEGA_HEX_ID) 
from png_mdsdb.pg_mega_application_assessments_infosec_checklists_final a 
Inner JOIN png_mdsdb.pg_mega_pgb_application_rita_final  b ON a.MEGA_HEX_ID=b.NAME AND a.sourceinstance=b.sourceinstance AND a.cdctype<>'D'
where b.cdctype<>'D' group by 1
UNION 
SELECT 'pg_mega_legacyg1_final',Count(distinct MEGA_ID) 
from  png_mdsdb.pg_mega_legacyg1_final a 
INNER JOIN png_mdsdb.pg_mega_pgb_application_rita_final b ON a.MEGA_ID=b.NAME AND a.sourceinstance =b.sourceinstance AND a.cdctype<>'D'
where b.cdctype<>'D' AND Status_vs_Baseline='Complete' 
group by 1
UNION 
SELECT 'pg_mega_legacyg234_final',Count(distinct Mega_ID)
FROM  png_mdsdb.pg_mega_legacyg234_final a
INNER JOIN png_mdsdb.pg_mega_pgb_application_rita_final b ON a.MEGA_ID=b.NAME AND a.sourceinstance =b.sourceinstance AND a.cdctype<>'D'
where b.cdctype<>'D' AND 
CIS_Rough_cut_assessment_done_YesNo='YES' OR CIS_Rough_cut_assessment_done_YesNo='Y' 
group by 1
UNION 
Select 'pg_mega_excluded_apps_final', Count(distinct megaid) 
from png_mdsdb.pg_mega_excluded_apps_final a 
Inner JOIN png_mdsdb.pg_mega_pgb_application_rita_final  b ON a.megaid=b.NAME AND a.sourceinstance=b.sourceinstance AND a.cdctype<>'D'
where b.cdctype<>'D' group by 1
UNION 
Select 'pg_mega_excluded_apps_final_Infosec_in_scope', Count(distinct megaid) 
from png_mdsdb.pg_mega_excluded_apps_final a 
Inner JOIN png_mdsdb.pg_mega_pgb_application_rita_final  b ON a.megaid=b.NAME AND a.sourceinstance=b.sourceinstance AND a.cdctype<>'D'
where (b.LIFE_CYCLE_STATUS IN ('Sunset','Retired'))
AND b.cdctype<>'D' group by 1;


-- Complete Count Validation  


SELECT 
Count(distinct a.NAME)as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final a
LEFT JOIN png_mdsdb.pg_mega_irisk_assessment_issues_final b ON a.NAME=b.MEGA_HEX_ID AND a.sourceinstance=b.sourceinstance AND b.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_legacyg1_final SRC2 ON a.NAME=SRC2.MEGA_ID AND a.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_legacyg234_final SRC3 ON a.NAME=SRC3.Mega_ID AND a.sourceinstance=SRC3.sourceinstance AND SRC3.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_excluded_apps_final SRC4 ON a.NAME=SRC4.megaid AND a.sourceinstance=SRC4.sourceinstance AND SRC4.cdctype<>'D'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON a.NAME=TRGT.row_id AND a.sourceinstance=TRGT.source_id
Where 
b.MEGA_HEX_ID IS NOT NULL 
OR SRC2.MEGA_ID IS NOT NULL AND SRC2.Status_vs_Baseline='Complete'
OR SRC3.Mega_ID IS NOT NULL AND (SRC3.CIS_Rough_cut_assessment_done_YesNo='YES' OR SRC3.CIS_Rough_cut_assessment_done_YesNo='Y')
OR SRC4.megaid IS NOT NULL
AND a.cdctype<>'D'



-- Correct iRisk_Open_Issues 

SELECT Count(1) as CNT 
FROM 
(
SELECT b.MEGA_HEX_ID,a.NAME,a.sourceinstance,
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
b.MEGA_HEX_ID IS NOT NULL 
OR SRC2.MEGA_ID IS NOT NULL AND SRC2.Status_vs_Baseline='Complete'
OR SRC3.Mega_ID IS NOT NULL AND (SRC3.CIS_Rough_cut_assessment_done_YesNo='YES' OR SRC3.CIS_Rough_cut_assessment_done_YesNo='Y')
OR SRC4.megaid IS NOT NULL
AND a.cdctype<>'D'

================================

-- Source Tables
Select'pg_mega_irisk_assessment_issues_final', Count(distinct MEGA_HEX_ID) 
from png_mdsdb.pg_mega_irisk_assessment_issues_final group by 1
UNION 
SELECT 'pg_mega_legacyg1_final',Count(distinct MEGA_ID) 
from  png_mdsdb.pg_mega_legacyg1_final group by 1
UNION 
SELECT 'pg_mega_legacyg234_final',Count(distinct Mega_ID)
FROM  png_mdsdb.pg_mega_legacyg234_final group by 1

 pg_mega_excluded_apps_final

=====================================
-- JOIN Condition 
SELECT SRC1.MEGA_HEX_ID,CASE WHEN SRC1.MEGA_HEX_ID IS NOT NULL THEN 'Y' ELSE 'N' END
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdsdb.pg_mega_irisk_assessment_issues_final SRC1 ON SRC.NAME=SRC1.MEGA_HEX_ID AND SRC.sourceinstance=SRC1.sourceinstance and SRC1.cdctype<>'D'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE SRC.cdctype<>'D'


-- exists_in_legacy_g1_c

Select Count(1) AS CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdsdb.pg_mega_legacyg1_final SRC1 ON SRC.NAME=SRC1.MEGA_ID AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype<>'D'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE (CASE WHEN SRC1.MEGA_ID IS NOT NULL AND SRC1.Status_vs_Baseline='Complete' THEN 'Y' ELSE 'N' END )<>TRGT.exists_in_legacy_g1_c
AND SRC.cdctype<>'D'
=============================================

-- exists_in_legacy_g234_c

Select Count(1) AS CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdsdb.pg_mega_legacyg234_final SRC1 ON SRC.NAME=SRC1.Mega_ID AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype<>'D'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE (CASE WHEN SRC1.Mega_ID IS NOT NULL AND (SRC1.CIS_Rough_cut_assessment_done_YesNo='YES' OR SRC1.CIS_Rough_cut_assessment_done_YesNo='Y') 
THEN 'Y' ELSE 'N' END )<>TRGT.exists_in_legacy_g234_c
AND SRC.cdctype<>'D'






	
	


iRisk_Category :

SELECT Count(1) as CNT 
FROM 
(
SELECT b.MEGA_HEX_ID,a.NAME,a.sourceinstance,
CASE WHEN b.MEGA_HEX_ID IS NOT NULL THEN 'Y' ELSE 'N' END AS Exisits_in_iRisk,
CASE WHEN SRC2.MEGA_ID IS NOT NULL THEN 'Y' ELSE 'N' END AS Exisits_in_Legacy1,
CASE WHEN SRC3.MEGA_ID IS NOT NULL THEN 'Y' ELSE 'N' END AS Exisits_in_Legacy234,
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
WHEN SRC.Exisits_in_iRisk ='Y' AND  (SRC.iRisk_Status IS NOT NULL) AND (SRC.iRisk_Status='Complete') AND (SRC.iRisk_Open_Issues IS NOT NULL) AND (SRC.iRisk_Open_Issues=0) THEN '4'
WHEN SRC.Exisits_in_iRisk ='Y' AND (SRC.iRisk_Status='Complete')  AND (SRC.iRisk_Open_Issues IS NOT NULL)  AND (SRC.iRisk_Open_Issues<>'N/A') AND (SRC.iRisk_Open_Issues<>0) THEN '5'
WHEN SRC.Exisits_in_iRisk ='Y' AND (SRC.iRisk_Status='Incomplete') THEN '6'
WHEN SRC.Exisits_in_iRisk <>'Y' AND (SRC.Exisits_in_Legacy1='Y') THEN '2'
WHEN SRC.Exisits_in_iRisk <>'Y' AND (SRC.Exisits_in_Legacy1<>'Y') AND (SRC.Exisits_in_Legacy234='Y') THEN '3'
ELSE '7'
END)<>TRGT.irisk_category_c;






Source_Category Code:

SELECT  cat , count(1) from 
(
SELECT ra.name, CASE WHEN irwi.MEGA_HEX_ID is NOT NULL THEN    
CASE WHEN SUM(case when irwi.mega_hex_id is not null THEN 1 ELSE 0 END) =  SUM(case when irwi.Assessment_Status in ('Complete','canceled','cancelled')
THEN 1 ELSE 0 END)   
THEN  IF(SUM( case when irwi.Assessment_Status IN ('Complete','Cancelled') and irwi.Issues_ID is not null and irwi.Issues_ID is not null   
and irwi.Overall_Status not in ('Complete','Draft') then 1  end) is NULL,4,5) ELSE 6   END   
WHEN irwi.MEGA_HEX_ID is NULL AND sum(case when Status_VS_Baseline = 'Complete' THEN 1 ELSE 0 END) > 0 THEN 2 
WHEN irwi.MEGA_HEX_ID is NULL AND sum(case when irl234.CIS_Rough_cut_assessment_done_YesNo = 'Yes' THEN 1 ELSE 0 END) > 0 THEN 3  
ELSE 7 END as cat  
from png_mdsdb.pg_mega_pgb_application_rita_final as ra 
left join png_mdsdb.pg_mega_irisk_assessment_issues_final as irwi on ra.name = irwi.MEGA_HEX_ID and ra.sourceinstance = irwi.sourceinstance and irwi.cdctype ='X' 
left join png_mdsdb.pg_mega_legacyg1_final as irl1 on ra.name = irl1.MEGA_ID and ra.sourceinstance = irl1.sourceinstance and irl1.cdctype ='X' 
left join png_mdsdb.pg_mega_legacyg234_final as irl234 on ra.name = irl234.MEGA_ID  and ra.sourceinstance = irl234.sourceinstance 
left join png_mdsdb.pg_mega_excluded_apps_final ex ON ra.NAME=ex.megaid AND ra.sourceinstance=ex.sourceinstance
and irl234.cdctype ='X' 
Where irwi.MEGA_HEX_ID IS NOT NULL 
OR irl1.MEGA_ID IS NOT NULL 
OR irl234.MEGA_ID IS NOT NULL
OR ex.megaid IS NOT NULL 
group by name)a 
group by 1 ;



SELECT 
Count(distinct a.NAME)as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final a
LEFT JOIN png_mdsdb.pg_mega_irisk_assessment_issues_final b ON a.NAME=b.MEGA_HEX_ID AND a.sourceinstance=b.sourceinstance AND b.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_legacyg1_final SRC2 ON a.NAME=SRC2.MEGA_ID AND a.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_legacyg234_final SRC3 ON a.NAME=SRC3.Mega_ID AND a.sourceinstance=SRC3.sourceinstance AND SRC3.cdctype<>'D'
LEFT JOIN png_mdsdb.pg_mega_excluded_apps_final SRC4 ON a.NAME=SRC4.megaid AND a.sourceinstance=SRC4.sourceinstance AND SRC4.cdctype<>'D'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON a.NAME=TRGT.row_id AND a.sourceinstance=TRGT.source_id
Where 
b.MEGA_HEX_ID IS NOT NULL 
OR SRC2.MEGA_ID IS NOT NULL AND SRC2.Status_vs_Baseline='Complete'
OR SRC3.Mega_ID IS NOT NULL AND (SRC3.CIS_Rough_cut_assessment_done_YesNo='YES' OR SRC3.CIS_Rough_cut_assessment_done_YesNo='Y')
OR SRC4.megaid IS NOT NULL
AND a.cdctype<>'D'




Helper_Infosec_Yes/No Count validation :

SELECT a.MEGA_HEX_ID,a.Helper_Name_of_Checklist_1 AS Helper_Check_List,MAX(STR_TO_DATE(a.Last_Updated_1,'%m/%d/%Y %h:%i %p'))
FROM png_mdsdb.pg_mega_application_assessments_infosec_checklists_final a
JOIN (Select distinct Mega_hex_id FROM png_mdsdb.pg_mega_application_assessments_infosec_checklists_final) b ON a.MEGA_HEX_ID=b.MEGA_HEX_ID 
where a.Helper_Name_of_Checklist_1='Application Security Controls Checklist'
group by 1,2
UNION 
SELECT a.MEGA_HEX_ID,a.Helper_Name_of_Checklist_2 AS Helper_Check_List,MAX(STR_TO_DATE(a.Last_Updated_1,'%m/%d/%Y %h:%i %p'))
FROM png_mdsdb.pg_mega_application_assessments_infosec_checklists_final a
JOIN (Select distinct Mega_hex_id FROM png_mdsdb.pg_mega_application_assessments_infosec_checklists_final) b ON a.MEGA_HEX_ID=b.MEGA_HEX_ID 
where a.Helper_Name_of_Checklist_2='Network Security Controls Checklist'
group by 1,2
UNION 
SELECT a.MEGA_HEX_ID,a.Helper_Name_of_Checklist_3 AS Helper_Check_List,MAX(STR_TO_DATE(a.Last_Updated_1,'%m/%d/%Y %h:%i %p'))
FROM png_mdsdb.pg_mega_application_assessments_infosec_checklists_final a
JOIN (Select distinct Mega_hex_id FROM png_mdsdb.pg_mega_application_assessments_infosec_checklists_final) b ON a.MEGA_HEX_ID=b.MEGA_HEX_ID 
where a.Helper_Name_of_Checklist_3='System Security Controls Checklist'
group by 1,2


SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='png_mdsdb' AND TABLE_NAME='pg_mega_application_assessments_infosec_checklists_final'
AND COLUMN_NAME LIKE 'infoSec%';



CUBE_Level Filter 

SELECT Count(1) as CNT 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ot_repository_type_c c ON b.application_nature_c_key=c.row_key
JOIN ldb.d_processing_activities_managing_organization_c d ON a.managing_organization_c_key=d.row_key
JOIN ldb.d_lov_processing_activities_ot_life_cycle_status_c  e ON b.data_asset_lifecycle_status_key=e.row_key
JOIN ldb.d_application_pg_data_privacy_c f ON b.application_pg_data_privacy_c_key=f.row_key
WHERE 
(
b.grace_period_c='Already in VP Tracker'
AND b.gdpr_rel_cal_overwritten='Y'
AND e.source_dimension_name IN ('Design/Build', 'Exception', 'Launch/Deploy', 'Leverage/Optimize', 'Qualify/Deliver', 'Retired', 'Sunset')
AND f.dimension_name IN ('High', 'Low', 'Medium')
AND c.cust_dimension_name_c IN ('Application', 'Application - Externally Owned', 'Component', 'NonDigital')
AND d.lev_1_organization_name IN 
(
'Consumer Services','FSS',
'IDQ','Information Security','IT Consumer Solutions',
'IT Customer Solutions & Delivery','IT Data & Analytics Organization',
'IT Solutions','MANAGEMENT SERVICES','Master Data Organization','MY PG SERVICES','IT IT innovation Organization',
'PS Shared Services & Technology Operations','PTW'
)
)


