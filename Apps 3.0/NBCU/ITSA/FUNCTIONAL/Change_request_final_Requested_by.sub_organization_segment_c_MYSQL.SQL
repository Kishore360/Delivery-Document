

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT > 0 THEN 'MDS to DW Data Validation Failed for Change_request_final_Requested_by.sub_organization_segment_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM nbcu_mdsdb.change_request_final a 
JOIN nbcu_mdsdb.sys_user_final b ON a.requested_by=b.sys_id AND a.sourceinstance=b.sourceinstance
JOIN nbcu_mdwdb.f_change_request TRGT ON a.sys_id=TRGT.row_id AND a.sourceinstance=TRGT.source_id
JOIN nbcu_mdwdb.d_internal_contact LKP ON (COALESCE(CONCAT('INTERNAL_CONTACT','~',a.requested_by),'UNSPECIFIED')=LKP.row_id AND a.sourceinstance=LKP.source_id)
WHERE b.u_sub_organization_segment<>LKP.sub_organization_segment_c
) temp; 





 
 