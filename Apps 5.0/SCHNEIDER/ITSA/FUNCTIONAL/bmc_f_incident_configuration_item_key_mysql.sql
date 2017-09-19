SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.configuration_item_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt  
from schneider_mdsdb.hpd_help_desk_final src 
inner join schneider_mdwdb.f_incident trgt on src.incident_number = trgt.row_id and src.sourceinstance = trgt.source_id  
left join (select name, sourceinstance, max(requestid) as latest_ci 
from schneider_mdsdb.bmc_core_bmc_baseelement_final where (name,sourceinstance,createdate) in 
(select name,sourceinstance,max(createdate) as latest_date 
from schneider_mdsdb.bmc_core_bmc_baseelement_final where datasetid = 'BMC.ASSET' group by name, sourceinstance) group by name,sourceinstance) src_lkp on src.ci = src_lkp.name and src.sourceinstance = src_lkp.sourceinstance
left join schneider_mdwdb.d_configuration_item lkp on src_lkp.latest_ci = lkp.row_id and src_lkp.sourceinstance = lkp.source_id 
where (case when src.ci is null then 0 when src.ci is not null and src_lkp.latest_ci is null then -1 when src.ci is not null and  src_lkp.latest_ci is not null then lkp.row_key else -1 end) <> coalesce(trgt.configuration_item_key,-1))a;