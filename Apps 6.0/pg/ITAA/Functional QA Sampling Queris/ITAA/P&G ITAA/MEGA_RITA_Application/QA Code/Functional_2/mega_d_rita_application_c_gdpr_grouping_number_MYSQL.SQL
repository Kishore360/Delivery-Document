Select Count(1) as CNT 
from pandg_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(select a.app_hexid,a.sourceinstance,a.responsible_org_unit_hexid,
CASE WHEN Count(1) <= 1 then MAX(coalesce(a.responsible_org_unit,'UNSPECIFIED')) else 'UNKNOWN' end as 'Owning_Organization'  
from pandg_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' 
group by a.app_hexid 
) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN pandg_mdsdb.pg_mega_pgv_application_data_model_final X ON SRC.name=X.APP_HEX AND SRC.sourceinstance=X.sourceinstance
LEFT JOIN pandg_mdsdb.pg_mega_pgv_org_itam_gbs_final level1
ON SRC1.responsible_org_unit_hexid=level1.LVL1_ORG_HEX AND SRC1.sourceinstance=level1.sourceinstance
 LEFT JOIN pandg_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
 WHERE 
(CASE WHEN 
(level1.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions') AND SRC.PG_DATA_PRIVACY IN ('High','Medium') AND
 SRC.Authorization_PII_Only='No')
OR (level1.LVL1_ORG_NAME ='MY PG SERVICES' AND SRC.PG_DATA_PRIVACY IN ('High','Medium') AND SRC.Authorization_PII_Only='No')
OR (level1.LVL1_ORG_NAME  NOT IN ('Consumer Services','IT Consumer Solutions', 'MY PG SERVICES')  
AND (SRC.AUTOMATED_DECISION_MAKING='yes' OR TRGT.gdpr_sensitivity='Sensitive' ))THEN 'GROUP1'
WHEN
(level1.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions') AND SRC.PG_DATA_PRIVACY ='low' AND SRC.Authorization_PII_Only='No')
OR (level1.LVL1_ORG_NAME ='MY PG SERVICES' AND SRC.PG_DATA_PRIVACY='low' AND SRC.Authorization_PII_Only='No')
THEN 'GROUP2' 
WHEN 
(level1.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions') AND SRC.PG_DATA_PRIVACY IN ('High','Medium') AND
SRC.Authorization_PII_Only='yes')
OR (level1.LVL1_ORG_NAME ='MY PG SERVICES' AND SRC.PG_DATA_PRIVACY IN ('High','Medium') AND SRC.Authorization_PII_Only='yes')
OR (level1.LVL1_ORG_NAME  NOT IN ('Consumer Services','IT Consumer Solutions', 'MY PG SERVICES') AND (SRC.PG_DATA_PRIVACY IN ('High','Medium'))
AND (SRC.AUTOMATED_DECISION_MAKING IN ('No','NULL')) AND (TRGT.gdpr_sensitivity='Non-Sensitive'))
THEN 'GROUP3'
WHEN 
(level1.LVL1_ORG_NAME IN ('Consumer Services','IT Consumer Solutions') AND SRC.PG_DATA_PRIVACY ='low' AND SRC.Authorization_PII_Only='yes')
OR (level1.LVL1_ORG_NAME ='MY PG SERVICES' AND SRC.PG_DATA_PRIVACY='low' AND SRC.Authorization_PII_Only='yes')
OR (level1.LVL1_ORG_NAME  NOT IN ('Consumer Services','IT Consumer Solutions', 'MY PG SERVICES') AND (SRC.AUTOMATED_DECISION_MAKING IN ('No','NULL'))
AND (TRGT.gdpr_sensitivity='Non-Sensitive')  AND (SRC.PG_DATA_PRIVACY ='low'))
THEN 'GROUP4'
ELSE 'UNSPECIFIED' END )<>TRGT.gdpr_grouping_number


 
