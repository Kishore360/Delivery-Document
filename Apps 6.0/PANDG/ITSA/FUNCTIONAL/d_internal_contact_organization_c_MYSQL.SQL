



SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for problem_d_location.region_name_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM pandg_mdsdb.sys_user_final a 
LEFT JOIN pandg_mdwdb.d_internal_contact b ON (CONCAT('INTERNAL_CONTACT~',a.sys_id)=b.row_id AND a.sourceinstance=b.source_id)
Where coalesce(a.u_organization,'UNSPECIFIED')<>b.organization_c
) temp;



