
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.gdpr_sensitivity' ELSE 'SUCCESS' END as Message
FROM 
(SELECT Count(1) as CNT 
FROM pandg_mdsdb.pg_mega_pgb_application_rita_final a 
LEFT JOIN 
(
select app_hex, sourceinstance,MAX(gdpr_sensitivity) as gdpr_sensitivity  from(
select app_hex, sourceinstance, ATTRIBUTE_NAME ,(CASE WHEN ATTRIBUTE_NAME in 
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
,'Other health or medical data') THEN 'Sensitive' ELSE 'Non-Sensitive' END) 
AS gdpr_sensitivity 
FROM pandg_mdsdb.pg_mega_pgv_application_data_model_final)Y
GROUP BY 1,2)X ON a.NAME=X.app_hex AND a.sourceinstance=X.sourceinstance AND a.cdctype <>'D'
LEFT JOIN pandg_mdwdb.d_rita_application_c TRGT ON a.NAME=TRGT.row_id AND a.sourceinstance=TRGT.source_id
WHERE COALESCE(X.gdpr_sensitivity,'UNSPECIFIED')<>TRGT.gdpr_sensitivity
) temp;
