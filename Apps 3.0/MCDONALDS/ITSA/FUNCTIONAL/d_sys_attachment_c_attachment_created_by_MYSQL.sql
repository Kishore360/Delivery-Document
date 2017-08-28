
SELECT 
CASE WHEN CNT >0  THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN CNT >0  THEN 'MDS to DW Data Validation Failed for d_sys_attachment_c_attachment_created_by' ELSE 'SUCCESS' END as MESSAGE
FROM (SELECT count(1) as CNT
FROM mcdonalds_mdsdb.sys_attachment_final a 
JOIN mcdonalds_mdsdb.sys_user_final b ON a.sys_created_by=b.user_name
JOIN mcdonalds_mdwdb.d_sys_attachment_c X ON a.sys_id=X.row_id and a.sourceinstance=X.source_id
WHERE Upper(b.name<>X.attachment_created_by))a;