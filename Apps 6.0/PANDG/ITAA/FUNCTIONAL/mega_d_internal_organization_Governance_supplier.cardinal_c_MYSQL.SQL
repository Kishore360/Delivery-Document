

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization_Governance_supplier.cardinal_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(SELECT a.NAME,b.app_hexid,b.sourceinstance,b.responsible_org_unit_hexid,b.responsible_org_unit
FROM pandg_mdsdb.pg_mega_pgb_application_rita_final a 
LEFT JOIN pandg_mdsdb.pg_mega_pgv_app_responsible_org_person_final b ON a.NAME=b.app_hexid AND a.sourceinstance=b.sourceinstance
WHERE b.pg_governance_supplier='Y' AND b.app_hexid IS NOT NULL ) SRC 
LEFT JOIN pandg_mdsdb.pg_mega_pgb_org_unit_final ORG ON SRC.responsible_org_unit_hexid=ORG.NAME AND SRC.sourceinstance=ORG.sourceinstance
LEFT JOIN pandg_mdwdb.d_internal_organization TRGT ON (COALESCE(SRC.responsible_org_unit_hexid,'UNSPECIFIED')=TRGT.row_id AND 
SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(ORG.CARDINAL,'UNSPECIFIED')<>TRGT.cardinal_c
) temp;



 