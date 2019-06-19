

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.category_src_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM png_mdsdb.change_request_final a 
LEFT JOIN png_mdwdb.d_change_request b ON a.sys_id=b.row_id AND a.sourceinstance=b.source_id
LEFT JOIN png_mdwdb.d_lov c ON CONCAT('CATEGORY_C','~','CHANGE','~',a.category)=c.row_id AND a.sourceinstance=c.source_id
WHERE COALESCE(c.row_key,CASE WHEN a.category IS NULL THEN 0 ELSE -1 END)<>b.category_src_key
AND a.cdctype<>'D'
) temp;


 
 
 