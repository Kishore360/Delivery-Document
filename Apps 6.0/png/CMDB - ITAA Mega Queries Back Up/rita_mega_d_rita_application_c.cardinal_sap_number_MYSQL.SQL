SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.cardinal_sap_number' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT NAME,
GROUP_CONCAT(distinct organization_name order by organization_name ) AS organization_name,
GROUP_CONCAT(distinct cardinal order by organization_name) as cardinal,
sourceinstance
FROM 
(
SELECT SRC.NAME AS NAME,responsible_org_unit,
CASE WHEN cardinal IS NULL OR cardinal='N' OR cardinal = '' OR cardinal=responsible_org_unit THEN responsible_org_unit
ELSE LEFT (REPLACE(REPLACE(responsible_org_unit,CONCAT(' - ',cardinal),''),cardinal,''),255) END as organization_name,cardinal,SRC.sourceinstance
FROM 
(
png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(
SELECT  app_hexid,responsible_org_unit_hexid,responsible_org_unit,sourceinstance,count(1) 
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final 
where (((third_party_with_access <>'No' AND third_party_with_access is not null)
or (pg_software_supplier  <>'N' AND pg_software_supplier is not null )
or (pg_service_manager_supplier <>'N' AND pg_service_manager_supplier is not null and pg_service_manager_supplier<>' ')
or (pg_implementation_supplier <>'N' AND pg_implementation_supplier is not null AND pg_implementation_supplier<>' ')
or (supplier <>'N' AND supplier is not null AND supplier<> ' '))) and app_hexid is not null and responsible_org_unit_hexid is not null
and cdctype<>'D' 
group by 1,2,3,4
) ORG ON SRC.NAME=ORG.app_hexid AND SRC.sourceinstance=ORG.sourceinstance AND SRC.cdctype<>'D'
LEFT JOIN 
(
SELECT distinct name,LEFT((cardinal),255) AS CARDINAL 
FROM png_mdsdb.pg_mega_pgb_org_unit_final
WHERE (cardinal IS NOT NULL AND cardinal <>'N' and cardinal<>'')  AND cdctype<>'D'  
) organization ON ORG.responsible_org_unit_hexid=organization.name
)
) Z 
GROUP  BY NAME 
) X
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON X.NAME=TRGT.row_id AND X.sourceinstance=TRGT.source_id
WHERE COALESCE(X.cardinal,'UNSPECIFIED')<>TRGT.cardinal_sap_number AND TRGT.soft_deleted_flag ='N'
) temp;

