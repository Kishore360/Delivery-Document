SELECT LEV.LVL0_ORG_NAME,SRC3.name,
Count(distinct SRC.u_pg_source_system_id) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN png_mdsdb.pg_mega_pgv_app_responsible_org_person_final SRC1 ON SRC.u_pg_source_system_id=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdsdb.pg_mega_u_cmdb_ci_appl_instance_final SRC2 ON SRC.sys_id=SRC2.u_pg_instance_of AND SRC.sourceinstance=SRC2.sourceinstance
LEFT JOIN png_mdsdb.cmn_location_final SRC3 ON SRC2.u_pg_using_site=SRC3.sys_id
LEFT JOIN 
(
Select DISTINCT a.sourceinstance,a.LVL0_ORG_NAME,a.LVL3_ORG_HEX,a.LVL2_ORG_HEX,a.LVL1_ORG_HEX,a.LVL0_ORG_HEX
FROM png_mdsdb.pg_mega_pgv_org_itam_gbs_final a 
-- WHERE LVL0_ORG_NAME in ('Corporate Function - IT (CF-IT)','Global Business Services Organization (GBS)')
WHERE a.cdctype<>'D' 
) LEV ON 
(SRC1.responsible_org_unit_hexid=LEV.LVL3_ORG_HEX OR SRC1.responsible_org_unit_hexid=LEV.LVL2_ORG_HEX 
OR SRC1.responsible_org_unit_hexid=LEV.LVL1_ORG_HEX OR SRC1.responsible_org_unit_hexid=LEV.LVL0_ORG_HEX) 
AND SRC1.sourceinstance=LEV.sourceinstance
WHERE SRC1.pg_development_org='Y' AND SRC1.app_hexid IS NOT NULL AND SRC.cdctype<>'D' AND SRC1.cdctype<>'D'
AND LEV.LVL0_ORG_NAME='PS' AND SRC3.name='ALBANY PLANT'
Group by 1,2;


Select distinct SRC.u_pg_source_system_id AS Application_ID,SRC.name AS Application_Name,SRC2.name AS Instance_Name,SRC2.u_pg_instance_of,
SRC3.name AS Site_Name
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN png_mdsdb.pg_mega_pgv_app_responsible_org_person_final SRC1 ON SRC.u_pg_source_system_id=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdsdb.pg_mega_u_cmdb_ci_appl_instance_final SRC2 ON SRC.sys_id=SRC2.u_pg_instance_of AND SRC.sourceinstance=SRC2.sourceinstance
LEFT JOIN png_mdsdb.cmn_location_final SRC3 ON SRC2.u_pg_using_site=SRC3.sys_id
Where SRC.u_pg_source_system_id IN ('094E0B63570650C9','0B4B0BC259281A87')
AND SRC.cdctype='X';
