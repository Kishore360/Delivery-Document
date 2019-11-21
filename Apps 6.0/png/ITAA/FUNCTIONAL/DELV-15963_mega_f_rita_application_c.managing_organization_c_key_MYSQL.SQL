SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.managing_organization_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT X.sys_id,X.sourceinstance,
SUBSTRING_INDEX(GROUP_CONCAT(hex_id ORDER BY hex_order DESC,hex_id ASC separator '@'),'@',1) AS pg_development_org_hex
FROM 
(
SELECT SRC.sys_id,SRC.sourceinstance,SRC1.app_hexid,SRC1.sourceinstance as sourceinstance1,
CASE 
WHEN LVL3_ORG_HEX IS NOT NULL THEN SRC1.responsible_org_unit_hexid
WHEN LVL2_ORG_HEX IS NOT NULL THEN SRC1.responsible_org_unit_hexid
WHEN LVL1_ORG_HEX IS NOT NULL THEN SRC1.responsible_org_unit_hexid
WHEN LVL0_ORG_HEX IS NOT NULL THEN SRC1.responsible_org_unit_hexid
ELSE SRC1.responsible_org_unit_hexid
END as hex_id,
CASE
	WHEN LVL3_ORG_HEX =SRC1.responsible_org_unit_hexid THEN 3
	WHEN LVL2_ORG_HEX =SRC1.responsible_org_unit_hexid THEN 2
	WHEN LVL1_ORG_HEX =SRC1.responsible_org_unit_hexid THEN 1
	WHEN LVL0_ORG_HEX =SRC1.responsible_org_unit_hexid THEN 0
	ELSE -1
END as hex_order
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN png_mdsdb.pg_mega_pgv_app_responsible_org_person_final SRC1 ON SRC.u_pg_source_system_id=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN 
(
Select DISTINCT a.sourceinstance,a.LVL3_ORG_HEX,a.LVL2_ORG_HEX,a.LVL1_ORG_HEX,a.LVL0_ORG_HEX
FROM png_mdsdb.pg_mega_pgv_org_itam_gbs_final a WHERE LVL0_ORG_NAME in ('Corporate Function - IT (CF-IT)','Global Business Services Organization (GBS)')
AND a.cdctype<>'D' 
) LEV ON 
(SRC1.responsible_org_unit_hexid=LEV.LVL3_ORG_HEX OR SRC1.responsible_org_unit_hexid=LEV.LVL2_ORG_HEX 
OR SRC1.responsible_org_unit_hexid=LEV.LVL1_ORG_HEX OR SRC1.responsible_org_unit_hexid=LEV.LVL0_ORG_HEX) 
AND SRC1.sourceinstance=LEV.sourceinstance
WHERE SRC1.pg_development_org='Y' AND SRC1.app_hexid IS NOT NULL AND SRC.cdctype<>'D' AND SRC1.cdctype<>'D'
) X GROUP BY X.sys_id,X.sourceinstance
) Y
LEFT JOIN png_mdwdb.f_rita_application_c TRGT ON Y.sys_id=TRGT.row_id AND Y.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_internal_organization LKP ON COALESCE(Y.pg_development_org_hex,'UNSPECIFIED')=LKP.row_id AND Y.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN Y.pg_development_org_hex IS NULL THEN 0 ELSE -1 END)<>TRGT.managing_organization_c_key
) temp;


