
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.rita_app_business_process_name' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) as CNT 
FROM 
(
SELECT NAME,sourceinstance,cdctype,GROUP_CONCAT(DISTINCT BP_NAME ORDER BY BP_NAME) AS BP_NAME
FROM 
(
SELECT a.NAME,a.sourceinstance,BP.BP_NAME,cdctype FROM png_mdsdb.pg_mega_pgb_application_rita_final a 
LEFT JOIN 
(
SELECT app_hex,sourceinstance,BP_NAME,Count(1) FROM png_mdsdb.pg_mega_snv_app_assoc_business_process_final
WHERE (app_hex IS NOT NULL )AND (BP_NAME IS NOT NULL and BP_NAME <>'') AND cdctype <>'D'
GROUP BY 1,2,3) BP ON a.NAME=BP.app_hex AND a.sourceinstance=BP.sourceinstance
) X 
GROUP BY NAME
) SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON (SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id )
WHERE COALESCE(SRC.BP_NAME,'UNSPECIFIED')<>TRGT.rita_app_business_process_name
AND SRC.cdctype<>'D'
) temp; 

