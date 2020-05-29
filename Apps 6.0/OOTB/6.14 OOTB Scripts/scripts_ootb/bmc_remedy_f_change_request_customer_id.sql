SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN (select company, sourceinstance, max(company_entry_id) as company_entry_id
from #MDS_TABLE_SCHEMA.hlx_com_company_final 
where (company,sourceinstance,submit_date) in 
(select company,sourceinstance,max(submit_date) as latest_date 
from #MDS_TABLE_SCHEMA.hlx_com_company_final  group by company,sourceinstance) 
 group by company,sourceinstance) comp
on SRC.company=comp.company
LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
ON (SRC.Infrastructure_Change_ID=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN  #DWH_TABLE_SCHEMA.d_organization_customer  LKP 
ON CONCAT('ORG_CUST~',comp.company_entry_id) = LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN comp.company_entry_id IS NULL THEN 0 else '-1' end) <> COALESCE(TRGT.customer_key,'')


