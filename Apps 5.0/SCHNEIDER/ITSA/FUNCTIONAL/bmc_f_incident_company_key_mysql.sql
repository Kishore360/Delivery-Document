
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.opened_by_key' ELSE 'SUCCESS' END as Message from 
 schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.entry_id = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id  
left join (select company, sourceinstance, max(company_entry_id) as latest_company 
from schneider_mdsdb.com_company_final where (company,sourceinstance,submit_date) in 
(select company,sourceinstance,max(submit_date) as latest_date 
from schneider_mdsdb.com_company_final group by company,sourceinstance) group by company, sourceinstance) company on SRC.company = company.company 
and SRC.sourceinstance = company.sourceinstance
LEFT JOIN schneider_mdwdb.d_internal_organization LKP 
ON ( concat('SUBSIDIARY~',company.latest_company))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end) <>  (TRGT.company_key)
