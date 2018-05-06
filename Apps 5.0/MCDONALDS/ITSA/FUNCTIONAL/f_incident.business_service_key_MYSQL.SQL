
SELECT 
CASE WHEN cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.business_service_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as cnt 
FROM mcdonalds_mdwdb.f_incident trgt
RIGHT JOIN mcdonalds_mdsdb.incident_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcdonalds_mdwdb.d_service lkp
ON COALESCE(CONCAT('BUSINESS_SERVICE~',src.business_service),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.business_service IS NULL THEN 0 else -1 end)<> trgt.business_service_key)a;