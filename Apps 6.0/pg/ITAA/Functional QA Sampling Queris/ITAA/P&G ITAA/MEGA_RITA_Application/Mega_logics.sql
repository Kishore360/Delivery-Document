MEGA-LOGICS 

Responsible_Org_Person: 

Select a.NAME,b.app_hexid,a.sourceinstance,b.sourceinstance,a.SHORT_NAME,b.app_name
from pandg_mdsdb.pg_mega_pgb_application_rita_final a
LEFT JOIN pandg_mdsdb.pg_mega_pgv_app_responsible_org_person_final b ON a.NAME=b.app_hexid AND a.sourceinstance=b.sourceinstance
LEFT JOIN pandg_mdwdb.f_rita_application_c c ON a.NAME=c.row_id AND a.sourceinstance=c.source_id


Application_Manager: 

Select a.app_hexid,count(1),CASE WHEN count(1) <= 1 THEN MAX(COALESCE(a.person_intranet_id,'UNSPECIFIED')) ELSE 'UNKNOWN' 
END AS 'Application_Manager'
from pandg_mdsdb.pg_mega_pgv_app_responsible_org_person_final a where a.application_manager='Y'
group by 1;

Sensitivty :

SELECT Count(1) as CNT
from pandg_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN 
(SELECT a.app_hex,a.sourceinstance,
 MAX(CASE WHEN ATTRIBUTE_NAME IN  
 ('Biometric data'
,'Genetic data'
,'Sex life, sexual orientation questions'
,'Data about children under 13'
,'Criminal or judicial records'
,'Precise geo location data'
,'Racial or ethnic origin'
,'Political opinions, political party affiliation'
,'Trade union membership'
,'Protected Health Information (“PHI”) as defined by HIPAA'
,'Other health or medical data') THEN 'Sensitive' ELSE 'Non-Sensitive' END) as gdpr_sensitivity 
from pandg_mdsdb.pg_mega_pgv_application_data_model_final a
group by a.app_hex) SRC1 ON SRC.name=SRC1.APP_HEX AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN pandg_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE SRC1.gdpr_sensitivity<>TRGT.gdpr_sensitivity


Grace period :
SRC.APPLICATION_NATURE IN ('Generic','XOApplication','NonDigital','Component')
AND SRC.LIFE_CYCLE_STATUS  NOT IN ('Decomissioned','Exception Use','not_used','Undecided')
AND TRGT.gdpr_relevant_c_flag ='Y' 


managing_organization_c_key (mega) and png_ot_organization_c_key (OT) keys in Fact (f_rita_application_c)