

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.category_src_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM png_mdsdb.incident_final a 
LEFT JOIN png_mdwdb.d_incident b ON a.sys_id=b.row_id AND a.sourceinstance=b.source_id
LEFT JOIN png_mdwdb.d_lov c ON CONCAT('CATEGORY','~','INCIDENT','~',a.category)=c.row_id AND a.sourceinstance=c.source_id
WHERE COALESCE(c.row_key,CASE WHEN a.category IS NULL THEN 0 ELSE -1 END)<>b.category_src_key
AND a.cdctype<>'D'
) temp;


 