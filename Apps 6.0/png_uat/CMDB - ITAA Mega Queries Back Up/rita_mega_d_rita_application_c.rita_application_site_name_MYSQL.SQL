/* SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.rita_application_site_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT NAME,sourceinstance,GROUP_CONCAT(DISTINCT site_name ORDER BY site_name) AS SITE_NAME
FROM 
(
SELECT a.NAME,SITE.site_name,a.sourceinstance
FROM png_mdsdb.pg_mega_pgb_application_rita_final  a
LEFT JOIN
(
SELECT app_hex,site_hex,site_name,sourceinstance,Count(1)
FROM png_mdsdb.pg_mega_pgv_application_site_pii_final WHERE app_hex IS NOT NULL AND site_hex <>'' AND cdctype<>'D'
group by 1,2,3
) SITE ON a.NAME=SITE.app_hex AND a.sourceinstance=SITE.sourceinstance
) X
GROUP BY NAME
) SRC  
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.SITE_NAME,'UNSPECIFIED')<>TRGT.rita_application_site_name
) temp;
 */


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.rita_application_site_name' ELSE 'SUCCESS' END as Message
FROM 

(
SELECT Count(1) as CNT 
FROM 
(
SELECT NAME,sourceinstance,GROUP_CONCAT(DISTINCT site_name ORDER BY site_name) AS SITE_NAME
FROM 
(
SELECT a.NAME,SITE.site_name,a.sourceinstance
FROM png_mdsdb.pg_mega_pgb_application_rita_final  a
LEFT JOIN
(
SELECT app_hex,site_hex,site_name,sourceinstance,Count(1)
FROM png_mdsdb.pg_mega_pgv_application_site_pii_final WHERE app_hex IS NOT NULL AND site_hex <>'' AND cdctype<>'D'
group by 1,2,3
) SITE ON a.NAME=SITE.app_hex AND a.sourceinstance=SITE.sourceinstance
) X
GROUP BY NAME
) SRC  
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.SITE_NAME,'UNSPECIFIED')<>TRGT.rita_application_site_name
AND TRGT.soft_deleted_flag ='N'
) temp;


