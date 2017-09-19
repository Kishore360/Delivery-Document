
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.customer_key' ELSE 'SUCCESS' END as Message from 
 schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id  
left join (select company, sourceinstance, max(company_entry_id) as latest_customer 
from schneider_mdsdb.com_company_final where (company,sourceinstance,submit_date) in 
(select company,sourceinstance,max(submit_date) as latest_date 
from schneider_mdsdb.com_company_final where company_type = 'Customer' group by company,sourceinstance) and company_type = 'Customer' group by company, sourceinstance) customer on SRC.company = customer.company
and SRC.sourceinstance = customer.sourceinstance
LEFT JOIN schneider_mdwdb.d_internal_organization LKP 
ON ( concat('ORG_CUST~',customer.latest_customer))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end) <>  (TRGT.customer_key)
