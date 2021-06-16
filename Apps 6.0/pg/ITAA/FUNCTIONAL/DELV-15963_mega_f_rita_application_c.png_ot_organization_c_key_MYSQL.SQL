-- this is nothing but managing_organization_c_key
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.png_ot_organization_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT 
from
png_mdwdb.f_rita_application_c f
LEFT JOIN (
SELECT sys_id,sourceinstance,substring_index(group_concat(hex_id ORDER BY hex_order desc,hex_id asc separator '@'),'@',1) AS pg_development_org_hex FROM
(SELECT SRC.sys_id,a11.sourceinstance,
CASE 
	WHEN LVL3_ORG_HEX IS NOT NULL THEN a11.responsible_org_unit_hexid
	WHEN LVL2_ORG_HEX IS NOT NULL THEN a11.responsible_org_unit_hexid
	WHEN LVL1_ORG_HEX IS NOT NULL THEN a11.responsible_org_unit_hexid
	WHEN LVL0_ORG_HEX IS NOT NULL THEN a11.responsible_org_unit_hexid
	ELSE a11.responsible_org_unit_hexid
END as hex_id,
CASE
	WHEN LVL3_ORG_HEX = a11.responsible_org_unit_hexid THEN 3
	WHEN LVL2_ORG_HEX = a11.responsible_org_unit_hexid THEN 2
	WHEN LVL1_ORG_HEX = a11.responsible_org_unit_hexid THEN 1
	WHEN LVL0_ORG_HEX = a11.responsible_org_unit_hexid THEN 0
	ELSE -1
END as hex_order

FROM 
png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
JOIN
png_mdsdb.pg_mega_pgv_app_responsible_org_person_final  a11
on (SRC.u_pg_source_system_id=a11.app_hexid and SRC.sourceinstance=a11.sourceinstance)
LEFT JOIN  (SELECT DISTINCT sourceinstance, LVL3_ORG_HEX,LVL2_ORG_HEX, LVL1_ORG_HEX,LVL0_ORG_HEX from png_mdsdb.pg_mega_pgv_org_itam_gbs_final
				where LVL0_ORG_NAME in ('Corporate Function - IT (CF-IT)','Global Business Services Organization (GBS)')) as gbs 
	ON (a11.responsible_org_unit_hexid = gbs.LVL3_ORG_HEX or a11.responsible_org_unit_hexid = gbs.LVL2_ORG_HEX or a11.responsible_org_unit_hexid = gbs.LVL1_ORG_HEX or a11.responsible_org_unit_hexid = gbs.LVL0_ORG_HEX) AND a11.sourceinstance = gbs.sourceinstance
where pg_development_org = 'Y' and a11.cdctype='X'  and SRC.cdctype='X') all_rec
group by sys_id, sourceinstance)X
ON f.row_id=X.sys_id and f.source_id=X.sourceinstance
JOIN png_mdwdb.d_internal_organization LKP ON COALESCE(X.pg_development_org_hex,'UNSPECIFIED')=LKP.row_id AND X.sourceinstance=LKP.source_id
where f.png_ot_organization_c_key <> COALESCE(LKP.row_key,CASE WHEN X.pg_development_org_hex IS NULL THEN 0 ELSE -1 END)
) temp;










