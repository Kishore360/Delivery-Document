
SELECT 
CASE WHEN CNT THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN CNT THEN 'MDS to DW Data Validation Failed for d_sys_attachment_c_attachment_created_by' ELSE 'SUCCESS' END as MESSAGE
FROM (SELECT count(1) as CNT
FROM mcdonalds_mdsdb.sys_attachment_final a 
JOIN mcdonalds_mdwdb.d_sys_attachment_c X ON a.sys_id=X.row_id and a.sourceinstance=X.source_id
WHERE 
COALESCE(CONVERT_TZ(a.sys_created_on,'GMT','US/Central'),'UNSPECIFIED')<>X.attachment_created_on
)a;