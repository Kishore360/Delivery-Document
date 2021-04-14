

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.department_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
From ntt_om_mdsdb.sys_user_final SRC
LEFT JOIN ntt_om_mdwdb.d_internal_contact TRGT ON COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.sys_id),'UNSPECIFIED')=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.dv_department,'UNSPECIFIED')<>TRGT.department_c
AND SRC.cdctype='X'
) temp;

 
  