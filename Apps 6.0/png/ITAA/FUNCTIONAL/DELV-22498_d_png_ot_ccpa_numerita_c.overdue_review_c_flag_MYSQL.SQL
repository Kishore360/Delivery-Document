SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.overdue_review_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT 
Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a 
LEFT JOIN png_mdwdb.d_png_ot_ccpa_numerita_c b ON a.ID=b.row_id AND a.sourceinstance=b.source_id
where CASE WHEN datediff(NOW(),COALESCE(a.Last_review_date,a.Created)) > 365 THEN 'Y' ELSE 'N' END  <> b.overdue_review_c_flag
AND a.cdctype='X'
) temp; 



/* SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a 
LEFT JOIN png_mdwdb.d_png_ot_ccpa_numerita_c b ON a.ID=b.row_id AND a.sourceinstance=b.source_id
WHERE CASE WHEN ((a.Last_review_date IS NOT NULL and (datediff(Now(),a.Last_review_date) > 365))
OR (a.Last_review_date IS NULL AND (datediff(Now(),a.Created) > 365)) ) THEN 'Y'  ELSE 'N'

SELECT CASE WHEN datediff(NOW(),COALESCE(a.Last_review_date,a.Created)) > 365 THEN 'Y' ELSE 'N' END  AS Overdue_Flag,
Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a 
LEFT JOIN png_mdwdb.d_png_ot_ccpa_numerita_c b ON a.ID=b.row_id AND a.sourceinstance=b.source_id
where a.cdctype='X'
Group by 1;
 */
