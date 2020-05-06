/* CREATE INDEX IDX_GROUPING_ID ON png_mdsdb.pg_mega_pgb_application_rita_final(NAME,sourceinstance)
CREATE INDEX IDX_GROUPING_ID2 ON png_mdsdb.pg_mega_pgv_app_responsible_org_person_final(app_hexid,sourceinstance)
CREATE INDEX IDX_GROUPING_ID3 ON png_mdsdb.pg_mega_pgv_application_data_model_final(APP_HEX,sourceinstance)
CREATE INDEX IDX_GROUPING_ID4 ON png_mdsdb.pg_mega_pgv_app_data_cat_final(app_hexid,sourceinstance)
CREATE INDEX IDX_GROUPING_ID5 ON png_mdsdb.pg_mega_snv_app_assoc_business_process_final(app_hex,sourceinstance)
CREATE INDEX IDX_GROUPING_ID6 ON png_mdsdb.pg_mega_pgv_app_le_final(APP_HEXID,sourceinstance) */


Code has been changed as per the DELV-19795


now only 13 mandaoty Fileds, 

17- 4 (DELV-19795 was removed). 

There are the below 4 values :
LEs receiving the service
Data retention period in days
Automated decision making
Reason for data collection
If these fields are used in any other GDPR reports sourcing from Mega/ServiceNow please also remove them.



SELECT COUNT(Distinct SRC.NAME) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(SELECT a.app_hexid,a.sourceinstance,
CASE WHEN COUNT(distinct responsible_org_unit_hexid) <= 1 THEN MAX(COALESCE(a.responsible_org_unit_hexid,'UNSPECIFIED')) ELSE 'UNKNOWN' END AS responsible_org_unit_hexid  
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' GROUP BY a.app_hexid,a.sourceinstance
) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN 
(
SELECT X.APP_HEX,X.sourceinstance,MAX(X.ATTRIBUTE_NAME) AS ATTRIBUTE_NAME
FROM png_mdsdb.pg_mega_pgv_application_data_model_final X WHERE X.ATTRIBUTE_NAME IS NOT NULL
group by X.APP_HEX,X.sourceinstance
) ATT_NAME ON SRC.name=ATT_NAME.APP_HEX AND SRC.sourceinstance=ATT_NAME.sourceinstance
LEFT JOIN png_mdsdb.pg_mega_pgv_org_itam_gbs_final ORG_LEVEL1
ON (SRC1.responsible_org_unit_hexid=ORG_LEVEL1.LVL1_ORG_HEX AND SRC1.sourceinstance=ORG_LEVEL1.sourceinstance)
LEFT JOIN 
(select a.app_hexid,a.sourceinstance,CASE WHEN COUNT(distinct person_intranet_id) <= 1 THEN MAX(COALESCE(a.person_intranet_id,'UNSPECIFIED')) ELSE 'UNKNOWN' END AS 'person_intranet_id'  from png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a  where a.application_manager = 'Y'
group by a.app_hexid) ASSET_OWNER ON SRC.NAME=ASSET_OWNER.app_hexid AND SRC.sourceinstance=ASSET_OWNER.sourceinstance
LEFT JOIN 
(
SELECT a.app_hexid,a.sourceinstance,CASE WHEN COUNT(1) <= 1 THEN MAX(COALESCE(a.responsible_org_unit_hexid,'UNSPECIFIED')) ELSE 'UNKNOWN' END AS 'responsible_org_unit_hexid'  
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a where a.data_controller = 'Y' 
GROUP BY app_hexid
)DATA_VENDOR 
ON (SRC.NAME=DATA_VENDOR.app_hexid AND SRC.sourceinstance=DATA_VENDOR.sourceinstance)
LEFT JOIN png_mdsdb.pg_mega_pgv_app_responsible_org_person_final PII_DATA ON SRC.NAME=PII_DATA.app_hexid AND SRC.sourceinstance=PII_DATA.sourceinstance
LEFT JOIN 
(
SELECT a.app_hexid,a.sourceinstance,MAX(DATA_CAT_HEXID) AS DATA_CATEGORY
FROM png_mdsdb.pg_mega_pgv_app_data_cat_final a 
GROUP BY app_hexid 
)DATA_CAT ON SRC.NAME=DATA_CAT.APP_HEXID AND SRC.sourceinstance=DATA_CAT.sourceinstance
LEFT JOIN
(SELECT a.app_hex,a.sourceinstance,
MAX(a.SITE_HEX) AS 'In_which_country_are_you_collecting_PII'
FROM png_mdsdb.pg_mega_pgv_application_site_pii_final a 
group by a.app_hex ) SITE ON (SRC.name=SITE.app_hex AND SRC.sourceinstance=SITE.sourceinstance)
LEFT JOIN 
(SELECT a.APP_HEX,a.sourceinstance,MAX(BP_HEX) AS 'Business_Process_Service_png_Hierarchy'
FROM png_mdsdb.pg_mega_snv_app_assoc_business_process_final a 
GROUP BY a.APP_HEX) BP_SER ON SRC.NAME=BP_SER.app_hex AND SRC.sourceinstance=BP_SER.sourceinstance
LEFT JOIN 
(
SELECT a.APP_HEXID,a.sourceinstance,MAX(a.LE_HEXID) AS 'Contractual_Data_What_are_the_LEs_receiving_the_services'
FROM png_mdsdb.pg_mega_pgv_app_le_final a 
GROUP BY a.APP_HEXID) CONTRACT_LE  ON SRC.NAME=CONTRACT_LE.APP_HEXID AND SRC.sourceinstance=CONTRACT_LE.sourceinstance
LEFT JOIN 
(SELECT app_hexid,rp.sourceinstance,
MAX(ORG.CARDINAL) AS 'Service_Operations_Supplier_SAP_Code'
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final rp 
INNER JOIN (SELECT DISTINCT NAME,CARDINAL FROM png_mdsdb.pg_mega_pgb_org_unit_final) AS ORG  ON rp.responsible_org_unit_hexid= ORG.NAME
WHERE pg_service_manager_supplier ='Y' 
GROUP BY app_hexid) SE_SAP_CODE ON SRC.NAME=SE_SAP_CODE.app_hexid AND SRC.sourceinstance=SE_SAP_CODE.sourceinstance
LEFT JOIN 
(SELECT app_hexid,rp.sourceinstance,
MAX(ORG.CARDINAL) AS 'Software_Supplier_SAP_CODE'
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final rp 
INNER JOIN (SELECT DISTINCT NAME,CARDINAL FROM png_mdsdb.pg_mega_pgb_org_unit_final) AS ORG  ON rp.responsible_org_unit_hexid= ORG.NAME
WHERE pg_software_supplier ='Y' 
GROUP BY app_hexid) SOF_SAP_CODE ON SRC.NAME=SOF_SAP_CODE.app_hexid AND SRC.sourceinstance=SOF_SAP_CODE.sourceinstance
LEFT JOIN 
(SELECT app_hexid,rp.sourceinstance,
MAX(ORG.CARDINAL) AS 'Technology_Supplier_SAP_CODE'
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final rp 
INNER JOIN (SELECT DISTINCT NAME,CARDINAL FROM png_mdsdb.pg_mega_pgb_org_unit_final) AS ORG  ON rp.responsible_org_unit_hexid= ORG.NAME
WHERE supplier ='Y' 
GROUP BY app_hexid) TECH_SAP_CODE ON SRC.NAME=TECH_SAP_CODE.app_hexid AND SRC.sourceinstance=TECH_SAP_CODE.sourceinstance
LEFT JOIN 
(SELECT app_hexid,rp.sourceinstance,
MAX(ORG.CARDINAL) AS 'Implementation_Supplier_SAP_CODE'
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final rp 
INNER JOIN (SELECT DISTINCT NAME,CARDINAL FROM png_mdsdb.pg_mega_pgb_org_unit_final) AS ORG  ON rp.responsible_org_unit_hexid= ORG.NAME
WHERE pg_implementation_supplier ='Y' 
GROUP BY app_hexid) IMPLE_SAP_CODE ON SRC.NAME=IMPLE_SAP_CODE.app_hexid AND SRC.sourceinstance=IMPLE_SAP_CODE.sourceinstance

LEFT JOIN 
(SELECT app_hexid,sourceinstance,MAX(org.CARDINAL) as Other_Suppliers_SAP_CODE
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final AS  rp
JOIN  (SELECT distinct name,CARDINAL FROM png_mdsdb.pg_mega_pgb_org_unit_final) as org ON rp.responsible_org_unit_hexid = org.name
WHERE  pg_service_manager_supplier = 'N'  and pg_software_supplier = 'N' and supplier = 'N' and pg_implementation_supplier = 'N' 
AND  app_hexid IS NOT NULL AND  responsible_org_unit_hexid IS NOT NULL AND org.CARDINAL <> '' and org.CARDINAL IS NOT NULL
OR (pg_service_manager_supplier IS NULL  and pg_software_supplier IS NULL and supplier IS NULL and pg_implementation_supplier IS NULL)
GROUP BY app_hexid) OSU_SAP_CODE ON SRC.NAME=OSU_SAP_CODE.app_hexid AND SRC.sourceinstance=OSU_SAP_CODE.sourceinstance

WHERE 
(SRC.APPLICATION_NATURE IS NOT NULL AND SRC.APPLICATION_NATURE <> '')
AND (SRC.APPLICATION_NATURE_DESC IS NOT NULL AND SRC.APPLICATION_NATURE_DESC  <> '')
AND (SRC.LIFE_CYCLE_STATUS IS NOT NULL AND SRC.LIFE_CYCLE_STATUS <> '')
AND (ASSET_OWNER.person_intranet_id IS NOT NULL AND ASSET_OWNER.person_intranet_id <> '')
AND (ORG_LEVEL1.LVL1_ORG_NAME IS NOT NULL AND ORG_LEVEL1.LVL1_ORG_NAME <> '')
AND (ORG_LEVEL1.LVL1_ORGLEAD_NAME IS NOT NULL AND ORG_LEVEL1.LVL1_ORGLEAD_NAME <> '')
AND (PII_DATA.pii_handled_for_specific_bp IS NOT NULL AND PII_DATA.pii_handled_for_specific_bp <> '')
AND (DATA_CAT.DATA_CATEGORY IS NOT NULL AND DATA_CAT.DATA_CATEGORY <> '') 
AND (SITE.In_which_country_are_you_collecting_PII IS NOT NULL AND SITE.In_which_country_are_you_collecting_PII <> '')
AND (SRC.PG_DATA_PRIVACY IS NOT NULL AND SRC.PG_DATA_PRIVACY <> '')
AND (SRC.AUTOMATED_DECISION_MAKING IS NOT NULL AND SRC.AUTOMATED_DECISION_MAKING <> '')
AND (SRC.RETENTION_SPAN_YEARS IS NOT NULL  AND SRC.RETENTION_SPAN_YEARS <> '')
AND (SRC.LEGITIMATE_INTEREST IS NOT NULL AND SRC.LEGITIMATE_INTEREST <> '')
AND (SRC.TOTAL_PG_PERSONNEL_WITH_ACCESS IS NOT NULL AND SRC.TOTAL_PG_PERSONNEL_WITH_ACCESS <> '')
AND (SRC.TOTAL_3RD_PARTY_WITH_ACCESS IS NOT NULL AND SRC.TOTAL_3RD_PARTY_WITH_ACCESS <> '')
AND (SRC.VOLUME_OF_RECORDS_ALL IS NOT NULL AND SRC.VOLUME_OF_RECORDS_ALL <> '' )
AND (SRC.VOLUME_OF_RECORDS_EU IS NOT NULL AND SRC.VOLUME_OF_RECORDS_EU <> '')
AND (SRC.PII_DATA_ACCESSED_OUTSIDE_EU IS NOT NULL AND SRC.PII_DATA_ACCESSED_OUTSIDE_EU <> '')
AND (BP_SER.Business_Process_Service_png_Hierarchy IS NOT NULL AND BP_SER.Business_Process_Service_png_Hierarchy <> '')
AND (CONTRACT_LE.Contractual_Data_What_are_the_LEs_receiving_the_services IS NOT NULL AND CONTRACT_LE.Contractual_Data_What_are_the_LEs_receiving_the_services <> '')
AND (SE_SAP_CODE.Service_Operations_Supplier_SAP_Code IS NOT NULL AND SE_SAP_CODE.Service_Operations_Supplier_SAP_Code <> '')
AND (SOF_SAP_CODE.Software_Supplier_SAP_CODE IS NOT NULL AND SOF_SAP_CODE.Software_Supplier_SAP_CODE <> '')
AND (TECH_SAP_CODE.Technology_Supplier_SAP_CODE IS NOT NULL AND TECH_SAP_CODE.Technology_Supplier_SAP_CODE <> '')
AND (IMPLE_SAP_CODE.Implementation_Supplier_SAP_CODE IS NOT NULL AND IMPLE_SAP_CODE.Implementation_Supplier_SAP_CODE <> '')
AND (OSU_SAP_CODE.Other_Suppliers_SAP_CODE IS NOT NULL AND OSU_SAP_CODE.Other_Suppliers_SAP_CODE <> '')




