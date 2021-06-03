

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.scorecard_group_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT
FROM terex_mdsdb.incident_final SRC 
LEFT JOIN terex_mdwdb.f_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id 
JOIN terex_mdwdb.d_internal_organization LKP ON TRGT.assignment_group_key=LKP.row_key 
WHERE(
CASE 
WHEN COALESCE(LKP.organization_name,'UNSPECIFIED') IN( 'English Service Desk','Global Service Desk UAM Team' )
OR COALESCE(LKP.organization_name,'UNSPECIFIED') Like ('%Campus%') 
OR COALESCE(LKP.organization_name,'UNSPECIFIED') Like ('%Dispatch%')  THEN 'Service Desk'
WHEN COALESCE(LKP.organization_name,'UNSPECIFIED')='TMS - 2nd Level Support' THEN 'TMS Help Desk'
WHEN COALESCE(LKP.organization_name,'UNSPECIFIED') 
IN ( 'GIOS - Infrastructure Requests','GIOS _ telephony','GIOS _ Network','Desktop Engineering Support') THEN 'Infrastructure' 
ELSE 'Other IT'  END )<> LKP.scorecard_group_c
AND SRC.cdctype='X'
) temp; 


 
