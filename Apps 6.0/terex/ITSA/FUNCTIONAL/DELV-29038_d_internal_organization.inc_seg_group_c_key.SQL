

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.inc_seg_group_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT
FROM terex_mdwdb.d_incident a 
JOIN terex_mdwdb.d_internal_contact b ON a.affected_user_c_key=b.row_key
JOIN terex_mdwdb.d_internal_organization c ON b.inc_company_c_key=c.row_key 
LEFT JOIN terex_mdwdb.d_moc_c d ON c.organization_name=d.value_c
WHERE COALESCE(d.row_key,-1)<>c.inc_seg_group_c_key
AND a.soft_deleted_flag='N'
) temp; 


