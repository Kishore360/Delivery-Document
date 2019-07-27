LEVEL0 Owning Organization :
SELECT distinct responsible_org_unit_hexid,level1.LVL0_ORG_NAME,Count(distinct SRC.NAME) as CNT
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(SELECT a.app_hexid,a.sourceinstance,a.responsible_org_unit AS Owning_Organization,
CASE WHEN Count(distinct responsible_org_unit_hexid) <= 1 THEN MAX(COALESCE(a.responsible_org_unit_hexid,'UNSPECIFIED')) ELSE 
'UNKNOWN' end as responsible_org_unit_hexid  
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' 
group by a.app_hexid,a.sourceinstance
) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN png_mdsdb.pg_mega_pgv_org_itam_gbs_final level1
ON (SRC1.responsible_org_unit_hexid=level1.LVL1_ORG_HEX OR SRC1.responsible_org_unit_hexid=level1.LVL2_ORG_HEX
OR SRC1.responsible_org_unit_hexid=level1.LVL3_ORG_HEX)
AND SRC1.sourceinstance=level1.sourceinstance 
group by 1;

LEVELS: 
SELECT distinct SRC1.responsible_org_unit_hexid,SRC1.Owning_Organization,level1.LVL1_ORG_NAME,level1.LVL1_ORGLEAD_NAME,
LVL2_ORG_NAME, level1.LVL2_ORGLEAD_NAME,LVL3_ORG_NAME,level1.LVL3_ORGLEAD_NAME,
Count(distinct SRC.NAME)
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(SELECT a.app_hexid,a.sourceinstance,a.responsible_org_unit AS Owning_Organization,
CASE WHEN Count(distinct responsible_org_unit_hexid) <= 1 THEN MAX(COALESCE(a.responsible_org_unit_hexid,'UNSPECIFIED')) ELSE 
'UNKNOWN' end as responsible_org_unit_hexid  
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' 
group by a.app_hexid,a.sourceinstance
) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN png_mdsdb.pg_mega_pgv_org_itam_gbs_final level1
ON (SRC1.responsible_org_unit_hexid=level1.LVL1_ORG_HEX OR SRC1.responsible_org_unit_hexid=level1.LVL2_ORG_HEX
OR SRC1.responsible_org_unit_hexid=level1.LVL3_ORG_HEX)
AND SRC1.sourceinstance=level1.sourceinstance 
WHERE SRC1.Owning_Organization='MY PG SERVICES'
group by 1	

GDPR_RELEVANT_FLAG: 

SELECT distinct SRC.SHORT_NAME,(CASE WHEN SRC1.KEYWORD_NAME  IN ('ITAM: GDPR - Relevance: No') THEN 'N'
WHEN SRC1.KEYWORD_NAME IN ('ITAM: GDPR - Relevance: Yes') THEN 'Y'  
WHEN (SRC.VOLUME_OF_RECORDS_ALL IS NULL 
OR SRC.VOLUME_OF_RECORDS_ALL='' 
OR SRC.VOLUME_OF_RECORDS_ALL= '0') THEN 'N' ELSE 'Y' END) AS Soruce,TRGT.gdpr_relevant_c_flag
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdsdb.pg_mega_pgb_app_keyword_final SRC1 ON SRC.NAME=SRC1.APP_HEXID AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN  png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(CASE WHEN (SRC.VOLUME_OF_RECORDS_ALL IS NULL 
OR SRC.VOLUME_OF_RECORDS_ALL='' 
OR SRC.VOLUME_OF_RECORDS_ALL= '0') THEN 'N' ELSE 
CASE WHEN SRC1.KEYWORD_NAME  IN ('ITAM: GDPR - Relevance: No') THEN 'N'
WHEN SRC1.KEYWORD_NAME IN ('ITAM: GDPR - Relevance: Yes') THEN 'Y' END)<>TRGT.gdpr_relevant_c_flag




select app_hexid, 'Service Operations Supplier SAP Code', max(org.CARDINAL) as value
from png_mdsdb.pg_mega_pgv_app_responsible_org_person_final as rp
inner join  (select distinct name,CARDINAL from png_mdsdb.pgb_org_unit_final) as org
on rp.responsible_org_unit_hexid = org.name
where pg_service_manager_supplier = 'Y' and  app_hexid is not null and  responsible_org_unit_hexid is not null and org.CARDINAL <> ''
group by app_hexid



(SELECT app_hexid,rp.sourceinstance,
MAX(ORG.CARDINAL) AS 'Service_Operations_Supplier_SAP_Code'
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final rp 
INNER JOIN (SELECT DISTINCT NAME,CARDINAL FROM png_mdsdb.pg_mega_pgb_org_unit_final) AS ORG  ON rp.responsible_org_unit_hexid= ORG.NAME
WHERE pg_service_manager_supplier ='Y' 
GROUP BY app_hexid) SE_SAP_CODE


(SELECT app_hexid,rp.sourceinstance,
MAX(ORG.CARDINAL) AS 'Technology_Supplier_SAP_CODE'
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final rp 
INNER JOIN (SELECT DISTINCT NAME,CARDINAL FROM png_mdsdb.pg_mega_pgb_org_unit_final) AS ORG  ON rp.responsible_org_unit_hexid= ORG.NAME
WHERE supplier ='Y' 
GROUP BY app_hexid) TECH_SAP_CODE ON SRC.NAME=SOF_SAP_CODE.app_hexid AND SRC.sourceinstance=SOF_SAP_CODE.sourceinstance


(SELECT app_hexid,rp.sourceinstance,
MAX(ORG.CARDINAL) AS 'Other_Suppliers_SAP_CODE'
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final rp 
INNER JOIN (SELECT DISTINCT NAME,CARDINAL FROM png_mdsdb.pg_mega_pgb_org_unit_final) AS ORG  ON rp.responsible_org_unit_hexid= ORG.NAME
WHERE pg_governance_supplier ='Y' 
GROUP BY app_hexid) OSU_SAP_CODE ON SRC.NAME=OSU_SAP_CODE.app_hexid AND SRC.sourceinstance=OSU_SAP_CODE.sourceinstance



SELECT  SRC.NAME,Count(distinct SRC1.responsible_org_unit_hexid)
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN png_mdsdb.pg_mega_pgv_app_responsible_org_person_final SRC1 ON SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance
WHERE SRC1.pg_development_org ='Y' AND SRC1.app_hexid IS NOT NULL
having Count(distinct SRC1.responsible_org_unit_hexid) >1;

SELECT LKP.dimension_name,Count(1) as CNT,Count(a.total_complete)
FROM png_mdwdb.f_rita_application_c a
 JOIN png_mdwdb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
LEFT JOIN png_mdwdb.d_lov LKP ON b.gdpr_grouping_name_c_key=LKP.row_key
group by 1;


Select b.q_quarter_number_c,b.q_quarter_number_numeric_c,b.quarter_name,c.year_name
from ldb.d_calendar_date_fiscal a 
JOIN ldb.d_calendar_fiscal_quarter b ON a.quarter_start_date_key=b.row_key
JOIN ldb.d_calendar_fiscal_year c ON b.year_start_date_key=c.row_key


SELECT SRC.SHORT_NAME,SRC.NAME,SRC1.app_hexid,SRC1.responsible_org_unit  AS Owning_Organization,
SRC1.responsible_org_unit_hexid,level1.LVL1_ORG_HEX,level1.LVL2_ORG_HEX,level1.LVL3_ORG_HEX,level1.LVL3_ORG_NAME AS L3_Owning_Organization,
level1.LVL2_ORG_NAME AS L2_Owning_Organization,level1.LVL1_ORG_NAME AS L1_Owning_Organization
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(SELECT a.app_hexid,a.sourceinstance,a.responsible_org_unit,
CASE WHEN Count(1) <= 1 then MAX(coalesce(a.responsible_org_unit_hexid,'UNSPECIFIED')) ELSE 'UNKNOWN' end as responsible_org_unit_hexid  
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' 
group by a.app_hexid,a.sourceinstance
) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN png_mdsdb.pg_mega_pgv_org_itam_gbs_final level1
ON (SRC1.responsible_org_unit_hexid=level1.LVL1_ORG_HEX OR SRC1.responsible_org_unit_hexid=level1.LVL2_ORG_HEX
OR SRC1.responsible_org_unit_hexid=level1.LVL3_ORG_HEX)
AND SRC1.sourceinstance=level1.sourceinstance
WHERE SRC.SHORT_NAME ='???? Foundation (PAC device)';



INDEX Creation :

CREATE INDEX GROUPING_ID ON png_mdsdb.pg_mega_pgb_application_rita_final(NAME,sourceinstance)
CREATE INDEX GROUPING_ID2 ON pg_mega_pgv_app_responsible_org_person_final(app_hexid,pg_development_org,responsible_org_unit_hexid,sourceinstance)
CREATE INDEX GROUPING_ID3 ON png_mdsdb.pg_mega_pgv_application_data_model_final (APP_HEX,sourceinstance)
CREATE INDEX GROUPING_ID4 ON png_mdsdb.pg_mega_pgv_org_itam_gbs_final (LVL1_ORG_HEX,LVL2_ORG_HEX,LVL3_ORG_HEX,sourceinstance)


==========================================

LEVELS :

SELECT distinct SRC1.responsible_org_unit_hexid,SRC1.Owning_Organization,level1.LVL1_ORG_NAME,level1.LVL1_ORGLEAD_NAME,
LVL2_ORG_NAME, level1.LVL2_ORGLEAD_NAME,LVL3_ORG_NAME,level1.LVL3_ORGLEAD_NAME,
Count(distinct SRC.NAME)
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(SELECT a.app_hexid,a.sourceinstance,a.responsible_org_unit AS Owning_Organization,
CASE WHEN Count(distinct responsible_org_unit_hexid) <= 1 THEN MAX(COALESCE(a.responsible_org_unit_hexid,'UNSPECIFIED')) ELSE 
'UNKNOWN' end as responsible_org_unit_hexid  
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' 
group by a.app_hexid,a.sourceinstance
) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN png_mdsdb.pg_mega_pgv_org_itam_gbs_final level1
ON (SRC1.responsible_org_unit_hexid=level1.LVL1_ORG_HEX OR SRC1.responsible_org_unit_hexid=level1.LVL2_ORG_HEX
OR SRC1.responsible_org_unit_hexid=level1.LVL3_ORG_HEX)
AND SRC1.sourceinstance=level1.sourceinstance 
WHERE SRC1.Owning_Organization='MY PG SERVICES'
group by 1		


============================

Source Query:
Select 'pg_mega_pgb_application_rita_final',Count(1) as CNT
FROM png_mdsdb.pg_mega_pgb_application_rita_final a where a.cdctype<>'D'
UNION 
SELECT 'd_rita_application_c',Count(1) as CNT 
FROM png_mdwdb.d_rita_application_c a 
group by 1
UNION 
SELECT 'f_rita_application_c',Count(1) as CNT 
FROM png_mdwdb.f_rita_application_c b where b.soft_deleted_flag='N';


MDWD Query :

Select distinct x.organization_name,y.organization_name,e.user_name,Count(1) as CNT
From png_mdwdb.f_rita_application_c a 
JOIN png_mdwdb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN png_mdwdb.d_internal_organization c ON a.managing_organization_c_key=c.row_key
JOIN png_mdwdb.d_internal_organization_hierarchy_c d ON c.row_dn_key=d.lvl_owning_organization_c_key
JOIN png_mdwdb.d_internal_organization x ON d.lvl0_organization_c_key=x.row_key
JOIN png_mdwdb.d_internal_organization y ON d.lvl1_organization_c_key=y.row_key
JOIN png_mdwdb.d_internal_contact e ON d.lvl1_organization_lead_c_key=e.row_key
where x.organization_name='Global Business Services Organization (GBS)'
group by 1,2,3;







SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.cardinal_sap_number' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT SRC.NAME,SRC.sourceinstance, 
GROUP_CONCAT(DISTINCT Organization) AS Organization_NAME,
GROUP_CONCAT(DISTINCT CARDINAL_CODE) AS CARDINAL_CODE 
FROM pandg_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN 
(SELECT a.app_hexid,a.responsible_org_unit_hexid,a.sourceinstance,Count(1)
FROM pandg_mdsdb.pg_mega_pgv_app_responsible_org_person_final a 
WHERE (
a.pg_software_supplier<>'N' AND a.pg_software_supplier IS NOT NULL AND a.pg_software_supplier<>' ' )
OR (a.pg_service_manager_supplier<>'N' AND a.pg_service_manager_supplier IS NOT NULL AND a.pg_service_manager_supplier<>' ' )
OR (a.pg_implementation_supplier<>'N' AND a.pg_implementation_supplier IS NOT NULL AND a.pg_implementation_supplier<>' ' )
OR (a.supplier<>'N' AND a.supplier IS NOT NULL AND a.supplier<>' ' )
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
WHERE COALESCE(SRC1.CARDINAL_CODE,'UNSPECIFIED')<>TRGT.cardinal_sap_number
) temp;


