SELECT Count(1) as CNT 
FROM 
(
SELECT NAME,sourceinstance,cdctype,GROUP_CONCAT(DISTINCT BP_NAME ORDER BY BP_NAME) AS BP_NAME,LICENSE,PG_STANDARD,lead_solution_architect
FROM 
(
SELECT a.NAME,a.sourceinstance,a.PG_STANDARD AS PG_STANDARD,a.LICENSE AS LICENSE,Lead_Sol_Arcitect.lead_solution_architect AS lead_solution_architect,
BP.BP_NAME,cdctype FROM png_mdsdb.pg_mega_pgb_application_rita_final a 
LEFT JOIN 
(
SELECT app_hex,sourceinstance,BP_NAME,Count(1) FROM png_mdsdb.pg_mega_snv_app_assoc_business_process_final
WHERE (app_hex IS NOT NULL )AND (BP_NAME IS NOT NULL and BP_NAME <>'') AND cdctype <>'D'
GROUP BY 1,2,3) BP ON a.NAME=BP.app_hex AND a.sourceinstance=BP.sourceinstance
LEFT JOIN 
(
SELECT a.app_hexid,a.sourceinstance,
GROUP_CONCAT(distinct person_intranet_id) AS lead_solution_architect 
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a  WHERE 
(a.pg_architect IS NOT NULL AND a.pg_architect <> '' AND a.pg_architect <> 'N') AND cdctype<>'D'
group by a.app_hexid
) Lead_Sol_Arcitect ON a.NAME=Lead_Sol_Arcitect.app_hexid AND a.sourceinstance=Lead_Sol_Arcitect.sourceinstance
) X  
GROUP BY NAME
) SRC 
WHERE SRC.BP_NAME IS NOT NULL 
AND SRC.LICENSE IS NOT NULL 
AND SRC.PG_STANDARD IS NOT NULL 
AND SRC.lead_solution_architect IS NOT NULL
AND SRC.cdctype<>'D';



SELECT a.NAME,a.sourceinstance,
BP.BP_NAME,cdctype 
FROM png_mdsdb.pg_mega_pgb_application_rita_final a 
LEFT JOIN 
(
SELECT app_hex,sourceinstance,BP_NAME,Count(1) FROM png_mdsdb.pg_mega_snv_app_assoc_business_process_final
WHERE (app_hex IS NOT NULL )AND (BP_NAME IS NOT NULL and BP_NAME <>'') AND cdctype <>'D'
GROUP BY 1,2,3) BP ON a.NAME=BP.app_hex AND a.sourceinstance=BP.sourceinstance



==============================

COMPLETENESS_CODE 

SELECT COUNT(1) as CNT 
FROM 
(
SELECT X.NAME,X.sourceinstance,
CASE WHEN GROUP_CONCAT(DISTINCT GAP_COLUMN) IS NULL THEN '' ELSE GROUP_CONCAT(DISTINCT GAP_COLUMN) END AS EA_MISSING_DATA,
SUM(COMPLETE) AS EA_TOTAL_COMPLETED,
SUM(SCOPE_COL_COUNT) AS EA_SCOPE_COL_COUNT,
CASE WHEN SUM(COMPLETE)/SUM(SCOPE_COL_COUNT) =1 THEN 'Compliant' ELSE 'Not Compliant' END AS EA_COMPLIANCE
FROM 
(
-- BUSINESS_PROCESS
SELECT NAME,SRC.sourceinstance,
CASE WHEN SRC1.COL_VAL IS NULL OR SRC1.COL_VAL ='' THEN 'BUSINESS_PROCESS' ELSE NULL END AS GAP_COLUMN,
CASE WHEN SRC1.COL_VAL IS NULL OR SRC1.COL_VAL ='' THEN 0 ELSE 1 END AS COMPLETE,
1 AS SCOPE_COL_COUNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(
SELECT b.APP_HEX,b.sourceinstance,MAX(BP_HEX) AS COL_VAL,
Count(1) as CNT 
FROM png_mdsdb.pg_mega_snv_app_assoc_business_process_final b 
WHERE b.APP_HEX IS NOT NULL AND b.APP_HEX<>'' AND b.BP_HEX IS NOT NULL AND b.BP_HEX <>'' AND 
b.cdctype<>'D'
group by 1,2) SRC1 
ON SRC.NAME=SRC1.APP_HEX AND SRC.sourceinstance=SRC1.sourceinstance 
WHERE SRC.cdctype<>'D'
group by SRC.NAME
-- STANDARD
UNION ALL 
SELECT SRC.NAME,SRC.sourceinstance,
CASE WHEN SRC.PG_STANDARD IS NULL OR SRC.PG_STANDARD = '' THEN 'STANDARD' ELSE NULL END AS GAP_COLUMN,
CASE WHEN SRC.PG_STANDARD IS NULL OR SRC.PG_STANDARD = '' THEN 0 ELSE 1 END AS COMPLETE,
1 AS SCOPE_COL_COUNT
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
WHERE SRC.cdctype<>'D'
-- LICENSE
UNION ALL 
SELECT SRC.NAME,SRC.sourceinstance,
CASE WHEN SRC.LICENSE IS NULL OR SRC.LICENSE='' THEN 'LICENSE' ELSE NULL END AS GAP_COLUMN,
CASE WHEN SRC.LICENSE IS NULL OR SRC.LICENSE='' THEN 0 ELSE 1 END AS COMPLETE,
1 AS SCOPE_COL_COUNT
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
WHERE SRC.cdctype<>'D'
 -- LEAD_SOLUTION_ARCHITECT
UNION ALL 
SELECT SRC.NAME,SRC.sourceinstance,
CASE WHEN SRC1.COL_VAL IS NULL OR SRC1.COL_VAL ='' THEN 'LEAD_SOLUTION_ARCHITECT' ELSE NULL END AS GAP_COLUMN,
CASE WHEN SRC1.COL_VAL IS NULL OR SRC1.COL_VAL ='' THEN 0 ELSE 1 END AS COMPLETE,
1 AS SCOPE_COL_COUNT
FROM 
png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(
SELECT b.app_hexid,b.sourceinstance,MAX(b.person_intranet_id) AS COL_VAL
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final b
WHERE b.app_hexid IS NOT NULL AND b.person_intranet_id IS NOT NULL AND b.person_intranet_id<>''
AND b.pg_architect<>'' AND b.pg_architect IS NOT NULL AND b.pg_architect <>'N'
AND b.cdctype<>'D'
GROUP BY 1,2
) SRC1 ON SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance
WHERE SRC.cdctype<>'D'
) X
GROUP BY X.NAME,X.sourceinstance
) Y 
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON Y.NAME=TRGT.row_id AND Y.sourceinstance=TRGT.source_id 
WHERE Y.EA_TOTAL_COMPLETED<>TRGT.ea_total_completed_c



=======================================================================


Cube level Filter :

SELECT
Count(distinct a.row_id) as cnt 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
JOIN ldb.d_lov_mega_data_currentness_c d ON c.data_currentness_c_key=d.row_key
JOIN ldb.d_lov_mega_data_correct_c e ON c.data_correct_c_key=e.row_key
JOIN ldb.d_processing_activities_managing_organization_c a12 ON a.managing_organization_c_key=a12.row_key
JOIN ldb.d_lov_processing_activities_ot_life_cycle_status_c a13 ON b.application_lifecycle_status_c_key=a13.row_key
JOIN ldb.d_lov_processing_activities_ot_repository_type_c a14 ON b.application_nature_c_key=a14.row_key
WHERE 
(
a13.source_dimension_name IN ('Design/Build','Discovery/Requ.','Exception','Leverage/Optimize','Launch/Deploy',
'Qualify/Deliver','Retired','Sunset','Undecided','UNSPECIFIED')
AND 
a14.source_dimension_name IN ('Generic','XOApplication','XOPlatform','Platform')
AND a.soft_deleted_flag='N'
)