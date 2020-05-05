


SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0   THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_ext_c.overdue_review_flag_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT 
Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final a 
LEFT JOIN png_mdsdb.pg_ot_article30_final c ON a.Name =c.name and c.cdctype='X'
LEFT JOIN png_mdwdb.d_png_ot_processing_activities_inventory_ext_c b ON a.Inventory_Id=b.row_id AND a.sourceinstance=b.source_id
where CASE WHEN datediff(NOW(),COALESCE(a.Last_reviewed_date_New,c.Created_Date)) > 365 THEN 'Y' ELSE 'N' END  <> b.overdue_review_flag_c
AND a.cdctype='X'
) temp;


