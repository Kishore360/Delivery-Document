SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.associated_ci_count_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT
FROM etrade_mdwdb.d_change_failure SRC 
JOIN 
(
SELECT count(a.row_id) AS associated_ci_count_c,a.request_id02_c AS request_id02_c
FROM etrade_mdwdb.d_change_association_c a where a.request_type01_c='Configuration Item'
group by 2
) SRC1 ON SRC.row_id =SRC1.request_id02_c
WHERE COALESCE(SRC1.associated_ci_count_c,0)<>SRC.associated_ci_count_c
) temp; 





  