SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.ea_scope_col_count_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM 
(
SELECT X.sys_id,X.sourceinstance,
CASE WHEN GROUP_CONCAT(DISTINCT GAP_COLUMN) IS NULL THEN '' ELSE GROUP_CONCAT(DISTINCT GAP_COLUMN) END AS EA_MISSING_DATA,
SUM(COMPLETE) AS EA_TOTAL_COMPLETED,
SUM(SCOPE_COL_COUNT) AS EA_SCOPE_COL_COUNT,
CASE WHEN SUM(COMPLETE)/SUM(SCOPE_COL_COUNT) =1 THEN 'Compliant' ELSE 'Not Compliant' END AS EA_COMPLIANCE
FROM 
(
-- BUSINESS_PROCESS
SELECT sys_id,SRC.sourceinstance,
CASE WHEN SRC1.COL_VAL IS NULL OR SRC1.COL_VAL ='' THEN 'BUSINESS_PROCESS' ELSE NULL END AS GAP_COLUMN,
CASE WHEN SRC1.COL_VAL IS NULL OR SRC1.COL_VAL ='' THEN 0 ELSE 1 END AS COMPLETE,
1 AS SCOPE_COL_COUNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC
LEFT JOIN 
(
SELECT b.APP_HEX,b.sourceinstance,MAX(BP_HEX) AS COL_VAL,
Count(1) as CNT 
FROM png_mdsdb.pg_mega_snv_app_assoc_business_process_final b 
WHERE b.APP_HEX IS NOT NULL AND b.APP_HEX<>'' AND b.BP_HEX IS NOT NULL AND b.BP_HEX <>'' AND 
b.cdctype<>'D'
group by 1,2) SRC1 
ON SRC.u_pg_source_system_id=SRC1.APP_HEX AND SRC.sourceinstance=SRC1.sourceinstance 
WHERE SRC.cdctype<>'D'
group by SRC.sys_id
-- STANDARD
UNION ALL 
SELECT SRC.sys_id,SRC.sourceinstance,
CASE WHEN SRC.u_pg_standard IS NULL OR SRC.u_pg_standard = '' THEN 'STANDARD' ELSE NULL END AS GAP_COLUMN,
CASE WHEN SRC.u_pg_standard IS NULL OR SRC.u_pg_standard = '' THEN 0 ELSE 1 END AS COMPLETE,
1 AS SCOPE_COL_COUNT
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
WHERE SRC.cdctype<>'D'
-- LICENSE
UNION ALL 
SELECT SRC.sys_id,SRC.sourceinstance,
CASE WHEN SRC.u_license IS NULL OR SRC.u_license='' THEN 'LICENSE' ELSE NULL END AS GAP_COLUMN,
CASE WHEN SRC.u_license IS NULL OR SRC.u_license='' THEN 0 ELSE 1 END AS COMPLETE,
1 AS SCOPE_COL_COUNT
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
WHERE SRC.cdctype<>'D'
 -- LEAD_SOLUTION_ARCHITECT
UNION ALL 
SELECT SRC.sys_id,SRC.sourceinstance,
CASE WHEN SRC1.COL_VAL IS NULL OR SRC1.COL_VAL ='' THEN 'LEAD_SOLUTION_ARCHITECT' ELSE NULL END AS GAP_COLUMN,
CASE WHEN SRC1.COL_VAL IS NULL OR SRC1.COL_VAL ='' THEN 0 ELSE 1 END AS COMPLETE,
1 AS SCOPE_COL_COUNT
FROM 
png_mdsdb.pg_mega_cmdb_ci_appl_final SRC
LEFT JOIN 
(
SELECT b.app_hexid,b.sourceinstance,MAX(b.person_intranet_id) AS COL_VAL
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final b
WHERE b.app_hexid IS NOT NULL AND b.person_intranet_id IS NOT NULL AND b.person_intranet_id<>''
AND b.pg_architect<>'' AND b.pg_architect IS NOT NULL AND b.pg_architect <>'N'
AND b.cdctype<>'D'
GROUP BY 1,2
) SRC1 ON SRC.u_pg_source_system_id=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance
WHERE SRC.cdctype<>'D'
) X
GROUP BY X.sys_id,X.sourceinstance
) Y 
LEFT JOIN png_mdwdb.f_rita_application_c TRGT ON Y.sys_id=TRGT.row_id AND Y.sourceinstance=TRGT.source_id 
WHERE Y.EA_SCOPE_COL_COUNT<>TRGT.ea_scope_col_count_c
) temp;




  
  
