
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.corporate_division_c' ELSE 'SUCCESS' END as Message
FROM tjx_mdsdb.incident_final SRC
LEFT JOIN tjx_mdsdb. u_company_corporate_division_final LKP 
 ON  u_corporate_division= LKP.sys_id 
AND SRC.sourceinstance= LKP.sourceinstance 
 LEFT JOIN tjx_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE LKP.name<> (TRGT.corporate_division_c)