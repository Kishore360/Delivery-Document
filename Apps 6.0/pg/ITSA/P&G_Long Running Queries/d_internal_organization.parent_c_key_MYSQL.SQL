SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.parent_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.change_request_final a 
LEFT JOIN png_mdsdb.sys_user_group_final b ON a.assignment_group=b.sys_id AND a.sourceinstance=b.sourceinstance
-- LEFT JOIN png_mdsdb.sys_user_group_final c ON b.parent=c.sys_id AND b.sourceinstance=c.sourceinstance
JOIN png_mdwdb.d_internal_organization d ON CONCAT('GROUP~',a.assignment_group)=d.row_id and a.sourceinstance=d.source_id
JOIN png_mdwdb.d_internal_organization d1 ON CONCAT('GROUP~',b.parent)=d1.parent_row_id AND a.sourceinstance=d1.source_id
WHERE COALESCE(d1.row_key,CASE WHEN b.parent IS NULL THEN 0 ELSE -1 END)<>d.parent_c_key
AND a.cdctype='X'
) temp;



 