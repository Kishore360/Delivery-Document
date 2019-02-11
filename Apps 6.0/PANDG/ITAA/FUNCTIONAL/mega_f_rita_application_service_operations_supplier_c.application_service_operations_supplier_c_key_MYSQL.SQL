




SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_service_operations_supplier_c.application_service_operations_supplier_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT a.NAME,b.app_hexid,b.sourceinstance,b.responsible_org_unit_hexid,b.responsible_org_unit
FROM png_mdsdb.pg_mega_pgb_application_rita_final a 
LEFT JOIN png_mdsdb.pg_mega_pgv_app_responsible_org_person_final b ON a.NAME=b.app_hexid AND a.sourceinstance=b.sourceinstance
WHERE b.pg_service_manager_supplier='Y' AND b.app_hexid IS NOT NULL 
) SRC 
LEFT JOIN png_mdwdb.f_rita_application_service_operations_supplier_c TRGT 
ON CONCAT(SRC.app_hexid,'~',COALESCE(SRC.responsible_org_unit_hexid,'UNSPECIFIED'))=TRGT.row_id
AND SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_internal_organization LKP ON COALESCE(SRC.responsible_org_unit_hexid,'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.responsible_org_unit IS NULL THEN 0 ELSE -1 END)<>TRGT.application_service_operations_supplier_c_key
) temp;


