SELECT 
CASE WHEN cnt >0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0  THEN 'MDS to DWH data validation failed for f_incident.customer_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) cnt 
FROM jhi_mdsdb.incident_final SRC 
JOIN jhi_mdwdb.f_incident TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN jhi_mdwdb.d_organization_customer LKP ON (concat('ORG_CUST~',company)= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.customer_key)
) temp;





