SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.company_key' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC
LEFT JOIN (select company, sourceinstance, max(company_entry_id) as company_entry_id
from #MDS_TABLE_SCHEMA.hlx_com_company_final 
where (company,sourceinstance,submit_date) in 
(select company,sourceinstance,max(submit_date) as latest_date 
from #MDS_TABLE_SCHEMA.hlx_com_company_final  group by company,sourceinstance) 
 group by company,sourceinstance) comp
on SRC.company=comp.company
left join (SELECT * FROM  #DWH_TABLE_SCHEMA.f_change_task where soft_deleted_flag='N') TRGT 
ON (SRC.Task_ID=TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id)
LEFT JOIN  #DWH_TABLE_SCHEMA.d_internal_organization LKP 
ON CONCAT('SUBSIDIARY~',comp.company_entry_id) = LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN comp.company_entry_id IS NULL THEN 0 else '-1' end) <> COALESCE(TRGT.company_key,'')




 

 
 
 
 
 
