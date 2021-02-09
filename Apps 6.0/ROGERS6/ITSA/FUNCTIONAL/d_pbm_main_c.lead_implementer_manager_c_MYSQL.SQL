SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_pbm_main_c.lead_implementer_manager_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM rogers6_mdwdb.d_pbm_main_c A 
JOIN 
(
Select 
a.imt_people_remedy_department_c as dept,
MAX(a.imt_people_reporting_to_c) AS dept_reporting_manager,
Count(Distinct(a.imt_people_reporting_to_c)) AS reporting_cnt
From rogers6_mdwdb.d_imt_people_c a
Where a.soft_deleted_flag='N' AND  a.imt_people_category_c='department' AND a.row_key > 0
GROUP BY 1
) B ON A.lead_implementer_department_c=B.dept
WHERE CASE WHEN A.lead_implementer_department_c ='#MULTIVALUE' THEN 'UNSPECIFIED' WHEN B.reporting_cnt > 1 THEN '#MULTIVALUE' 
ELSE COALESCE(B.dept_reporting_manager,'UNSPECIFIED') END <> A.lead_implementer_manager_c 
) temp;

 