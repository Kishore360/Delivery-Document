SELECT 
CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_internal_organization.ag_org_category' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM png_mdsdb.us_itot_ag_category_c_final SRC
LEFT JOIN pgitsa_mdwdb.d_internal_organization TRGT ON TRGT.organization_name = SRC.assignment_group
WHERE COALESCE(SRC.Org_Category,'OTHER') <> TRGT.ag_org_category
AND SRC.cdctype='X'
)temp;

