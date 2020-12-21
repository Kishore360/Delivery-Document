SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.rita_app_solution_owner_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT NAME,sourceinstance,
GROUP_CONCAT(DISTINCT person_intranet_id ORDER BY person_intranet_id) AS person_intranet_id,
GROUP_CONCAT(DISTINCT person_email ORDER BY person_intranet_id) AS person_email 
FROM 
(
SELECT app.NAME,app.sourceinstance,org.person_intranet_id,org.person_email
FROM pandg_mdsdb.pg_mega_pgb_application_rita_final as app 
LEFT JOIN 
(SELECT app_hexid,sourceinstance,person_intranet_id,person_email,count(1)
FROM pandg_mdsdb.pg_mega_pgv_app_responsible_org_person_final  
WHERE (application_manager <> 'N' AND application_manager IS NOT NULL AND application_manager <> '')
AND app_hexid IS NOT NULL 
AND (person_intranet_id IS NOT NULL AND person_intranet_id <> '')
AND cdctype<>'D'
Group by 1,2,3,4) AS org 
ON app.NAME =org.app_hexid AND app.sourceinstance=org.sourceinstance
) Y 
GROUP BY NAME 
) SRC  
LEFT JOIN pandg_mdwdb.d_rita_application_c TRGT ON SRC.NAME =TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.person_intranet_id,'UNSPECIFIED')<>TRGT.rita_app_solution_owner_name
) temp;


