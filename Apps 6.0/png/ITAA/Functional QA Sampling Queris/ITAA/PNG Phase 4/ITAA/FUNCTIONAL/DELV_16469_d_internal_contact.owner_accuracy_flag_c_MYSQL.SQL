SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.owner_accuracy_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.sys_user_final SRC 
LEFT JOIN png_mdwdb.d_internal_contact TRGT ON COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.sys_id),'UNSPECIFIED')=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE (CASE WHEN SRC.active=1 AND SRC.u_employee_type IN ('Employee') THEN 'Y' ELSE 'N' END)<>TRGT.owner_accuracy_flag_c
AND SRC.cdctype<>'D'
) temp;








