Select 
(CASE WHEN 
(pgv_org_itam_gbs.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions') AND SRC.PG_DATA_PRIVACY IN ('High','Medium') AND
 SRC.Authorization_PII_Only='No')
OR (pgv_org_itam_gbs.LVL1_ORG_NAME ='MY PG SERVICES' AND SRC.PG_DATA_PRIVACY IN ('High','Medium') AND SRC.Authorization_PII_Only='No')
OR (pgv_org_itam_gbs.LVL1_ORG_NAME  NOT IN ('Consumer Services','IT Consumer Solutions', 'MY PG SERVICES')  AND 
((SRC.AUTOMATED_DECISION_MAKING='Y')
OR (
pgv_application_data_model.ATTRIBUTE_NAME IN 
('Genetic data','Biometric data','Sepgv_application_data_model life, sepgv_application_data_modelual orientation questions','Data about children under 13',
'Criminal or judicial records','Precise geo location data','Racial or ethnic origin','Political opinions, political party affiliation',
'Trade union membership','Protected Health Information (“PHI”) as defined by HIPAA','Other health or medical data','Data about teens between 13-15 years old')
)))
THEN 'GROUP1'
WHEN
(pgv_org_itam_gbs.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions') AND SRC.PG_DATA_PRIVACY ='Low' AND SRC.Authorization_PII_Only='No')
OR (pgv_org_itam_gbs.LVL1_ORG_NAME ='MY PG SERVICES' AND SRC.PG_DATA_PRIVACY='Low' AND SRC.Authorization_PII_Only='No')
THEN 'GROUP2' 
WHEN 
((pgv_org_itam_gbs.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions')) AND (SRC.PG_DATA_PRIVACY IN ('High','Medium')) AND
(SRC.Authorization_PII_Only='Y'))
OR ((pgv_org_itam_gbs.LVL1_ORG_NAME ='MY PG SERVICES') AND (SRC.PG_DATA_PRIVACY IN ('High','Medium')) AND (SRC.Authorization_PII_Only='Yes'))
OR (pgv_org_itam_gbs.LVL1_ORG_NAME  NOT IN ('Consumer Services','IT Consumer Solutions', 'MY PG SERVICES')
AND ((SRC.AUTOMATED_DECISION_MAKING IN ('N','NULL')) AND (pgv_application_data_model.ATTRIBUTE_NAME NOT IN 
('Genetic data','Biometric data','Sepgv_application_data_model life, sepgv_application_data_modelual orientation questions','Data about children under 13',
'Criminal or judicial records','Precise geo location data','Racial or ethnic origin','Political opinions, political party affiliation',
'Trade union membership','Protected Health Information (“PHI”) as defined by HIPAA','Other health or medical data','Data about teens between 13-15 years old'))
)
AND 
SRC.PG_DATA_PRIVACY IN ('High','Medium'))
THEN 'GROUP3'
WHEN 
((pgv_org_itam_gbs.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions')) AND (SRC.PG_DATA_PRIVACY ='Low') AND (SRC.Authorization_PII_Only='Yes'))
OR ((pgv_org_itam_gbs.LVL1_ORG_NAME ='MY PG SERVICES') AND (SRC.PG_DATA_PRIVACY='Low') AND (SRC.Authorization_PII_Only='Yes'))
OR ((pgv_org_itam_gbs.LVL1_ORG_NAME  NOT IN ('Consumer Services','IT Consumer Solutions', 'MY PG SERVICES'))
AND ((SRC.AUTOMATED_DECISION_MAKING IN ('N','NULL')) AND (pgv_application_data_model.ATTRIBUTE_NAME NOT IN 
('Genetic data','Biometric data','Sepgv_application_data_model life, sepgv_application_data_modelual orientation questions','Data about children under 13',
'Criminal or judicial records','Precise geo location data','Racial or ethnic origin','Political opinions, political party affiliation',
'Trade union membership','Protected Health Information (“PHI”) as defined by HIPAA','Other health or medical data','Data about teens between 13-15 years old'))
)
AND (SRC.PG_DATA_PRIVACY ='Low'))
THEN 'GROUP4'
ELSE 'UNSPECIFIED' END) AS Source_Grouping,Count(distinct SRC.NAME) as CNT
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC
LEFT JOIN 
(SELECT a.app_hepgv_application_data_modelid,a.sourceinstance,
CASE WHEN Count(1) <= 1 THEN MApgv_application_data_model(COALESCE(a.responsible_org_unit_hepgv_application_data_modelid,'UNSPECIFIED')) ELSE 'UNKNOWN' end as responsible_org_unit_hepgv_application_data_modelid  
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' AND a.app_hepgv_application_data_modelid IS NOT NULL
group by a.app_hepgv_application_data_modelid,a.sourceinstance
) pgv_app_responsible_org_person ON (SRC.NAME=pgv_app_responsible_org_person.app_hepgv_application_data_modelid AND SRC.sourceinstance=pgv_app_responsible_org_person.sourceinstance )
LEFT JOIN png_mdsdb.pg_mega_pgv_application_data_model_final pgv_application_data_model ON pgv_app_responsible_org_person.app_hepgv_application_data_modelid=pgv_application_data_model.APP_HEpgv_application_data_model AND SRC.sourceinstance=pgv_application_data_model.sourceinstance
LEFT JOIN png_mdsdb.pg_mega_pgv_org_itam_gbs_final pgv_org_itam_gbs
ON (pgv_app_responsible_org_person.responsible_org_unit_hepgv_application_data_modelid=pgv_org_itam_gbs.LVL1_ORG_HEpgv_application_data_model OR pgv_app_responsible_org_person.responsible_org_unit_hepgv_application_data_modelid=pgv_org_itam_gbs.LVL2_ORG_HEpgv_application_data_model
OR pgv_app_responsible_org_person.responsible_org_unit_hepgv_application_data_modelid=pgv_org_itam_gbs.LVL3_ORG_HEpgv_application_data_model)
AND pgv_app_responsible_org_person.sourceinstance=pgv_org_itam_gbs.sourceinstance 
AND SRC.cdctype<>'D'
group by 1;



cmdb_ci_appl.u_pg_data_privacy_risk
cmdb_ci_appl.u_authentication_authorization_pii_only
cmdb_ci_appl.u_pg_automateddecision_making

pgv_app_responsible_org_person.responsible_org_unit_hepgv_application_data_modelid
pgv_app_responsible_org_person.pg_development_org
pgv_org_itam_gbs.LVL1_ORG_NAME
pgv_org_itam_gbs.LVL1_ORG_HEpgv_application_data_model
pgv_org_itam_gbs.LVL2_ORG_HEpgv_application_data_model
pgv_org_itam_gbs.LVL3_ORG_HEpgv_application_data_model
pgv_application_data_model.ATTRIBUTE_NAME