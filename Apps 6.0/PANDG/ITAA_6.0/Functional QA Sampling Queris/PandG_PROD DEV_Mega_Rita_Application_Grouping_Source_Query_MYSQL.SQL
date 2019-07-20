Select 
(CASE WHEN 
(level1.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions') AND SRC.PG_DATA_PRIVACY IN ('High','Medium') AND
 SRC.Authorization_PII_Only='No')
OR (level1.LVL1_ORG_NAME ='MY PG SERVICES' AND SRC.PG_DATA_PRIVACY IN ('High','Medium') AND SRC.Authorization_PII_Only='No')
OR (level1.LVL1_ORG_NAME  NOT IN ('Consumer Services','IT Consumer Solutions', 'MY PG SERVICES')  AND 
((SRC.AUTOMATED_DECISION_MAKING='Y')
OR (
X.ATTRIBUTE_NAME IN 
('Genetic data','Biometric data','Sex life, sexual orientation questions','Data about children under 13',
'Criminal or judicial records','Precise geo location data','Racial or ethnic origin','Political opinions, political party affiliation',
'Trade union membership','Protected Health Information (“PHI”) as defined by HIPAA','Other health or medical data')
)))
THEN 'GROUP1'
WHEN
(level1.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions') AND SRC.PG_DATA_PRIVACY ='Low' AND SRC.Authorization_PII_Only='No')
OR (level1.LVL1_ORG_NAME ='MY PG SERVICES' AND SRC.PG_DATA_PRIVACY='Low' AND SRC.Authorization_PII_Only='No')
THEN 'GROUP2' 
WHEN 
((level1.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions')) AND (SRC.PG_DATA_PRIVACY IN ('High','Medium')) AND
(SRC.Authorization_PII_Only='Y'))
OR ((level1.LVL1_ORG_NAME ='MY PG SERVICES') AND (SRC.PG_DATA_PRIVACY IN ('High','Medium')) AND (SRC.Authorization_PII_Only='Yes'))
OR (level1.LVL1_ORG_NAME  NOT IN ('Consumer Services','IT Consumer Solutions', 'MY PG SERVICES')
AND ((SRC.AUTOMATED_DECISION_MAKING IN ('N','NULL')) AND (X.ATTRIBUTE_NAME NOT IN 
('Genetic data','Biometric data','Sex life, sexual orientation questions','Data about children under 13',
'Criminal or judicial records','Precise geo location data','Racial or ethnic origin','Political opinions, political party affiliation',
'Trade union membership','Protected Health Information (“PHI”) as defined by HIPAA','Other health or medical data'))
)
AND 
SRC.PG_DATA_PRIVACY IN ('High','Medium'))
THEN 'GROUP3'
WHEN 
((level1.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions')) AND (SRC.PG_DATA_PRIVACY ='Low') AND (SRC.Authorization_PII_Only='Yes'))
OR ((level1.LVL1_ORG_NAME ='MY PG SERVICES') AND (SRC.PG_DATA_PRIVACY='Low') AND (SRC.Authorization_PII_Only='Yes'))
OR ((level1.LVL1_ORG_NAME  NOT IN ('Consumer Services','IT Consumer Solutions', 'MY PG SERVICES'))
AND ((SRC.AUTOMATED_DECISION_MAKING IN ('N','NULL')) AND (X.ATTRIBUTE_NAME NOT IN 
('Genetic data','Biometric data','Sex life, sexual orientation questions','Data about children under 13',
'Criminal or judicial records','Precise geo location data','Racial or ethnic origin','Political opinions, political party affiliation',
'Trade union membership','Protected Health Information (“PHI”) as defined by HIPAA','Other health or medical data'))
)
AND (SRC.PG_DATA_PRIVACY ='Low'))
THEN 'GROUP4'
ELSE 'UNSPECIFIED' END) AS Source_Grouping,Count(distinct SRC.NAME) as CNT
FROM pandg_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(SELECT a.app_hexid,a.sourceinstance,
CASE WHEN Count(1) <= 1 THEN MAX(COALESCE(a.responsible_org_unit_hexid,'UNSPECIFIED')) ELSE 'UNKNOWN' end as responsible_org_unit_hexid  
FROM pandg_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' AND a.app_hexid IS NOT NULL
group by a.app_hexid,a.sourceinstance
) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN pandg_mdsdb.pg_mega_pgv_application_data_model_final X ON SRC1.app_hexid=X.APP_HEX AND SRC.sourceinstance=X.sourceinstance
LEFT JOIN pandg_mdsdb.pg_mega_pgv_org_itam_gbs_final level1
ON (SRC1.responsible_org_unit_hexid=level1.LVL1_ORG_HEX OR SRC1.responsible_org_unit_hexid=level1.LVL2_ORG_HEX
OR SRC1.responsible_org_unit_hexid=level1.LVL3_ORG_HEX)
AND SRC1.sourceinstance=level1.sourceinstance 
AND SRC.cdctype<>'D'
group by 1;
