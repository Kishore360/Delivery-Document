SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_issue_fixversions_c.work_item_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT
FROM etrade_mdsdb.issue_fixversions_final SRC
LEFT JOIN etrade_mdwdb.d_issue_fixversions_c TRGT ON CONCAT(SRC.issueId,'~',SRC.id)=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN etrade_mdwdb.d_work_item LKP ON SRC.issueId=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.issueId IS NULL THEN 0 ELSE -1 END)<>TRGT.work_item_c_key
) temp; 


