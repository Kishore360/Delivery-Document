
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.ag_level_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT
FROM png_mdsdb.incident_final SRC 
LEFT JOIN png_mdwdb.f_incident TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN png_mdwdb.d_internal_organization LKP on CONCAT('GROUP~',SRC.assignment_group)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
Where 
(CASE WHEN LKP.organization_name LIKE '%L4%' THEN 'L4'
WHEN LKP.organization_name LIKE '%L3%' THEN 'L3' 
WHEN LKP.organization_name LIKE '%L2%' THEN 'L2' 
WHEN LKP.organization_name LIKE '%L1%' THEN 'L1'
 ELSE 'UNSPECIFIED' END)<>LKP.ag_level_c

) temp;



