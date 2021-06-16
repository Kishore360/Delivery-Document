Select 
(CASE WHEN 
(level1.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions') AND SRC.PG_DATA_PRIVACY IN ('High','Medium') AND
 SRC.Authorization_PII_Only='No')
OR (level1.LVL1_ORG_NAME ='MY PG SERVICES' AND SRC.PG_DATA_PRIVACY IN ('High','Medium') AND SRC.Authorization_PII_Only='No')
OR (level1.LVL1_ORG_NAME  NOT IN ('Consumer Services','IT Consumer Solutions', 'MY PG SERVICES')  AND 
((SRC.AUTOMATED_DECISION_MAKING='yes')
OR (
X.ATTRIBUTE_NAME IN 
('Biometric data'
,'Genetic data','Sex life, sexual orientation questions','Data about children under 13'
,'Criminal or judicial records','Precise geo location data','Racial or ethnic origin'
,'Political opinions, political party affiliation','Trade union membership'
,'Protected Health Information (“PHI”) as defined by HIPAA','Other health or medical data')
)))
THEN 'GROUP1'
WHEN
(level1.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions') AND SRC.PG_DATA_PRIVACY ='low' AND SRC.Authorization_PII_Only='No')
OR (level1.LVL1_ORG_NAME ='MY PG SERVICES' AND SRC.PG_DATA_PRIVACY='low' AND SRC.Authorization_PII_Only='No')
THEN 'GROUP2' 
WHEN 
(level1.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions') AND SRC.PG_DATA_PRIVACY IN ('High','Medium') AND
SRC.Authorization_PII_Only='yes')
OR (level1.LVL1_ORG_NAME ='MY PG SERVICES' AND SRC.PG_DATA_PRIVACY IN ('High','Medium') AND SRC.Authorization_PII_Only='yes')
OR (level1.LVL1_ORG_NAME  NOT IN ('Consumer Services','IT Consumer Solutions', 'MY PG SERVICES') AND ((SRC.PG_DATA_PRIVACY IN ('High','Medium'))
AND (SRC.AUTOMATED_DECISION_MAKING IN ('No','NULL')))
AND  
(X.ATTRIBUTE_NAME NOT IN 
('Biometric data'
,'Genetic data','Sex life, sexual orientation questions','Data about children under 13'
,'Criminal or judicial records','Precise geo location data','Racial or ethnic origin',
'Political opinions, political party affiliation','Trade union membership',
'Protected Health Information (“PHI”) as defined by HIPAA','Other health or medical data')))
THEN 'GROUP3'
WHEN 
((level1.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions') AND SRC.PG_DATA_PRIVACY ='low' AND SRC.Authorization_PII_Only='yes'))
OR (level1.LVL1_ORG_NAME ='MY PG SERVICES' AND SRC.PG_DATA_PRIVACY='low' AND SRC.Authorization_PII_Only='yes')
OR (level1.LVL1_ORG_NAME  NOT IN ('Consumer Services','IT Consumer Solutions', 'MY PG SERVICES')
AND ((SRC.AUTOMATED_DECISION_MAKING IN ('No','NULL'))
AND (SRC.PG_DATA_PRIVACY ='low'))
AND 
(X.ATTRIBUTE_NAME NOT IN 
('Biometric data'
,'Genetic data','Sex life, sexual orientation questions','Data about children under 13'
,'Criminal or judicial records','Precise geo location data','Racial or ethnic origin'
,'Political opinions, political party affiliation','Trade union membership'
,'Protected Health Information (“PHI”) as defined by HIPAA','Other health or medical data')))
THEN 'GROUP4'
ELSE 'UNSPECIFIED' END) AS Source_Grouping,Count(SRC.SHORT_NAME) as CNT
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(SELECT a.app_hexid,a.sourceinstance,
CASE WHEN Count(distinct responsible_org_unit_hexid) <= 1 then MAX(coalesce(a.responsible_org_unit_hexid,'UNSPECIFIED')) else 'UNKNOWN' end as responsible_org_unit_hexid  
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' 
group by a.app_hexid,a.sourceinstance
) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN png_mdsdb.pg_mega_pgv_application_data_model_final X ON SRC.name=X.APP_HEX AND SRC.sourceinstance=X.sourceinstance
LEFT JOIN png_mdsdb.pg_mega_pgv_org_itam_gbs_final level1
ON (SRC1.responsible_org_unit_hexid=level1.LVL1_ORG_HEX OR SRC1.responsible_org_unit_hexid=level1.LVL2_ORG_HEX
OR SRC1.responsible_org_unit_hexid=level1.LVL3_ORG_HEX)
AND SRC1.sourceinstance=level1.sourceinstance
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
group by 1;

