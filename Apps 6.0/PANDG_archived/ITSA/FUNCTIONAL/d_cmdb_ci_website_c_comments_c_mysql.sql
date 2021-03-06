SELECT 
CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_cmdb_ci_website_c.comments_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_web_site_final SRC
LEFT JOIN png_mdwdb.d_cmdb_ci_website_c TRGT ON SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where CASE WHEN length(SRC.comments)>255 THEN  LEFT(coalesce(SRC.comments,'UNSPECIFIED'),250) ELSE SRC.comments END<> TRGT.comments_c
AND SRC.cdctype='X'
) temp;




