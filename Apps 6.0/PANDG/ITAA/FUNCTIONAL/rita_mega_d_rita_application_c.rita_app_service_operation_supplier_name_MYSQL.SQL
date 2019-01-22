

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.rita_app_service_operation_supplier_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT SRC.NAME,SRC.sourceinstance, 
GROUP_CONCAT(DISTINCT Organization ORDER BY Organization) AS Organization_NAME,
GROUP_CONCAT(DISTINCT CARDINAL_CODE ORDER BY CARDINAL_CODE) AS CARDINAL_CODE 
FROM pandg_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN 
(SELECT a.app_hexid,a.responsible_org_unit_hexid,a.sourceinstance,Count(1)
FROM pandg_mdsdb.pg_mega_pgv_app_responsible_org_person_final a 
WHERE (a.pg_service_manager_supplier<>'N' AND a.pg_service_manager_supplier IS NOT NULL AND a.pg_service_manager_supplier<>' ' )
AND a.app_hexid IS NOT NULL AND a.responsible_org_unit_hexid IS NOT NULL 
group by 1,2,3) ORG ON SRC.NAME=ORG.app_hexid AND SRC.sourceinstance=ORG.sourceinstance
LEFT JOIN 
(SELECT distinct b.NAME,LEFT((CARDINAL),255) AS CARDINAL_CODE,GENERICLOCALNAME,sourceinstance,
LEFT(replace(replace(replace(GENERICLOCALNAME, '[0000000000000000]',''),CONCAT('- ',CARDINAL),''),CARDINAL,'') ,255) AS Organization 
FROM pandg_mdsdb.pg_mega_pgb_org_unit_final b 
WHERE (b.CARDINAL IS NOT NULL AND b.CARDINAL<>'')) SE_CODE ON ORG.responsible_org_unit_hexid=SE_CODE.NAME AND ORG.sourceinstance=SE_CODE.sourceinstance
AND SRC.cdctype<>'D'
GROUP BY SRC.NAME
) SRC1  
LEFT JOIN 
pandg_mdwdb.d_rita_application_c TRGT ON SRC1.NAME=TRGT.row_id AND SRC1.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.Organization_NAME,'UNSPECIFIED')<>TRGT.rita_app_service_operation_supplier_name
) temp;


