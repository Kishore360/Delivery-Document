

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.assignment_group_type_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM png_mdsdb.sys_user_group_final a 
LEFT JOIN png_mdsdb.sys_user_group_type_final b ON left(a.type,32)=b.sys_id
LEFT JOIN png_mdwdb.d_internal_organization c ON a.sys_id=right(c.row_id,32)
Where COALESCE(b.name,'UNSPECIFIED')<>c.assignment_group_type_c
AND c.soft_deleted_flag='N'
) temp;



