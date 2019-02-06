SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.gdpr_sensitivity' ELSE 'SUCCESS' END as Message
FROM 
(SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final a 
LEFT JOIN 
(
select app_hex, sourceinstance,MAX(gdpr_sensitivity) as gdpr_sensitivity  from(
select app_hex, sourceinstance, ATTRIBUTE_NAME ,(CASE WHEN ATTRIBUTE_NAME in 
('Biometric data','Genetic data','Sex life, sexual orientation questions','Data about children under 13'
,'Criminal or judicial records','Precise geo location data','Racial or ethnic origin','Political opinions, political party affiliation'
,'Trade union membership','Data about teens between 13-15 years old'
,'Other health or medical data') OR ATTRIBUTE_NAME like '%Protected Health Information%' 
THEN 'Sensitive' ELSE 'Non-Sensitive' END) 
AS gdpr_sensitivity 
FROM png_mdsdb.pg_mega_pgv_application_data_model_final where cdctype<>'D')Y
GROUP BY 1,2)X ON a.NAME=X.app_hex AND a.sourceinstance=X.sourceinstance AND a.cdctype <>'D'
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON a.NAME=TRGT.row_id AND a.sourceinstance=TRGT.source_id
WHERE COALESCE(X.gdpr_sensitivity,'UNSPECIFIED')<>TRGT.gdpr_sensitivity
) temp;


