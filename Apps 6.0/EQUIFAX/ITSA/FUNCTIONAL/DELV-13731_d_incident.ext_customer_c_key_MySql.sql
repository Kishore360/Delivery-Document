SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.ext_customer_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) AS CNT 
FROM equifax_mdsdb.incident_final SRC 
-- left join equifax_mdsdb.core_company_final LKP on SRC.u_ext_customer=LKP.sys_id
LEFT JOIN equifax_mdwdb.f_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN equifax_mdwdb.d_organization_customer LKP on CONCAT('ORG_CUST~',SRC.u_ext_customer)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
-- left join equifax_mdwdb.d_internal_contact LKP on CONCAT('INTERNAL_CONTACT~',SRC.u_caller_group)=LKP.row_id AND SRC.sourceinstance=LKP.source_id

WHERE  COALESCE(LKP.row_key,CASE WHEN SRC.u_ext_customer IS NULL THEN 0 ELSE -1 END)<>TRGT.ext_customer_c_key and SRC.cdctype<>'D'
) temp;