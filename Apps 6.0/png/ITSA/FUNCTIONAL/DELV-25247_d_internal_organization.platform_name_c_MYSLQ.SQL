SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.platform_name_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM png_upg_b1_mdwdb.d_internal_organization a
INNER JOIN png_upg_b1_mdwdb.d_platform_name_c b ON a.organization_name=b.row_id
Where a.platform_name_c <> b.platform_name_c
AND a.soft_deleted_flag='N'
) temp; 


 
 
  