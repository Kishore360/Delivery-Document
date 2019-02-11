


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.company_name_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.incident_final a 
LEFT JOIN png_mdsdb.sys_user_group_final b ON a.assignment_group=b.sys_id AND a.sourceinstance=b.sourceinstance
LEFT JOIN png_mdsdb.core_company_final c ON b.u_company=c.sys_id AND b.sourceinstance=c.sourceinstance
LEFT JOIN png_mdwdb.d_internal_organization d ON b.sys_id=right(d.row_id,32) AND b.sourceinstance=d.source_id
Where c.name<>d.company_name_c
AND a.cdctype<>'D'
) temp;



