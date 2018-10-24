
SELECT 
CASE WHEN cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.business_service_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as cnt 
FROM mcdonalds_mdwdb.f_incident trgt
RIGHT JOIN ( SELECT * FROM mcdonalds_mdsdb.incident_final where  cdctype<>'D') SRC
on SRC.sys_id = trgt.row_id and SRC.sourceinstance = trgt.source_id
LEFT JOIN mcdonalds_mdwdb.d_service lkp
ON COALESCE(CONCAT('BUSINESS_SERVICE~',SRC.subcategory),'UNSPECIFIED') =lkp.row_id and SRC.sourceinstance = lkp.source_id
 left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and COALESCE(lkp.row_key,CASE WHEN SRC.subcategory IS NULL THEN 0 else -1 end)<> trgt.business_service_key)a;