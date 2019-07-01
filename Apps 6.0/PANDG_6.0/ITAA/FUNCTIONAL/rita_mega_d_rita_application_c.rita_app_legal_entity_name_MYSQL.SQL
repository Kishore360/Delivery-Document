SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.rita_app_legal_entity_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT NAME,sourceinstance,cdctype,GROUP_CONCAT(DISTINCT le_name ORDER BY le_name ) AS le_name FROM 
(
SELECT a.NAME,a.sourceinstance,LEG.le_name,cdctype
FROM png_mdsdb.pg_mega_pgb_application_rita_final a 
LEFT JOIN 
(SELECT app_hexid,sourceinstance,le_hexid,le_name,count(1) FROM png_mdsdb.pg_mega_pgv_app_le_final 
WHERE (le_hexid IS NOT NULL AND le_hexid<>'') AND (app_hexid IS NOT NULL AND cdctype<>'D')
GROUP BY 1,2,3,4) LEG ON a.NAME=LEG.app_hexid AND a.sourceinstance=LEG.sourceinstance
) X 
GROUP BY NAME 
) SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON (SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.le_name,'UNSPECIFIED')<>TRGT.rita_app_legal_entity_name
AND SRC.cdctype<>'D'
) temp;

