SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM tjxco_mdsdb.us_d_expense_item_final  a
join tjxco_mdwdb.d_expense_item b
ON a.row_id = b.row_id and a.sourceinstance=b.source_id
where a.short_description<>b.short_desc
) temp;