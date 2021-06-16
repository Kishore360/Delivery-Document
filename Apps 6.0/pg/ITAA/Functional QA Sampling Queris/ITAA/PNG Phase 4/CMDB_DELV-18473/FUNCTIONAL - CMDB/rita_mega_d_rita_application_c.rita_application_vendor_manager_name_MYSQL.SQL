SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.rita_application_vendor_manager_name' ELSE 'SUCCESS' END as Message
FROM 

(
SELECT Count(1) as CNT 
FROM 
(
SELECT NAME,sourceinstance,GROUP_CONCAT(DISTINCT person_intranet_id ORDER BY person_intranet_id) AS person_intranet_id,cdctype
FROM 
(
SELECT 
a.sys_id as NAME,a.sourceinstance,VED.person_intranet_id,cdctype
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final a 
LEFT JOIN 
(
SELECT app_hexid,sourceinstance,person_intranet_id,Count(1)
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final
WHERE (vendor_application_manager<>'N' AND vendor_application_manager IS NOT NULL AND vendor_application_manager<>'')
AND (app_hexid IS NOT NULL AND person_hex IS NOT NULL and cdctype='X')
GROUP by 1,2,3
) VED
ON a.u_pg_source_system_id=VED.app_hexid AND a.sourceinstance=VED.sourceinstance
) X 
GROUP BY NAME
) SRC 
LEFT JOIN 
png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.person_intranet_id,'UNSPECIFIED')<>TRGT.rita_application_vendor_manager_name
AND SRC.cdctype='X'
) temp;


