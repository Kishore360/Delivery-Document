
SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_work_order.configuration_item_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt  
from schneider_mdsdb.woi_workorder_final src 
inner join schneider_mdwdb.f_work_order trgt on src.work_order_id = trgt.row_id and src.sourceinstance = trgt.source_id  
left join (select reconciliationidentity, sourceinstance, max(requestid) as latest_ci 
from schneider_mdsdb.bmc_core_bmc_baseelement_final where (reconciliationidentity,sourceinstance,createdate) in 
(select reconciliationidentity,sourceinstance,max(createdate) as latest_date 
from schneider_mdsdb.bmc_core_bmc_baseelement_final where datasetid = 'BMC.ASSET' group by reconciliationidentity, sourceinstance) group by reconciliationidentity,sourceinstance) src_lkp on src.ci_reconid = src_lkp.reconciliationidentity and src.sourceinstance = src_lkp.sourceinstance
left join schneider_mdwdb.d_configuration_item lkp on src_lkp.latest_ci = lkp.row_id and src_lkp.sourceinstance = lkp.source_id 
where (case when src.ci_reconid is null or src.ci_reconid = '0' then 0 when src.ci_reconid is not null and src_lkp.latest_ci is null and src.ci_reconid <> '0' then -1 when src.ci_reconid is not null and  src.ci_reconid <> '0'and  src_lkp.latest_ci is not null then lkp.row_key else -1 end) <> coalesce(trgt.configuration_item_key,-1))a;

