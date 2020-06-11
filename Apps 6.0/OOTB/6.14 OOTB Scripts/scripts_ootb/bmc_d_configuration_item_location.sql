SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.location' ELSE 'SUCCESS' END as Message
FROM ( select base.requestid,base.SourceInstance,src_site.site
from #MDS_TABLE_SCHEMA.hlx_bmc_core_baseelement_final base
left join (select site, sourceinstance, max(site_id) as latest_site 
from #MDS_TABLE_SCHEMA.bmc_sit_site_final where (site,sourceinstance,submit_date) in 
(select site,sourceinstance,max(submit_date) as latest_date 
from #MDS_TABLE_SCHEMA.bmc_sit_site_final group by site,sourceinstance) group by site,sourceinstance
) src_site 
on base.site = src_site.site and base.sourceinstance = src_site.sourceinstance
where datasetid = 'BMC.ASSET' and classid <> 'BMC_PERSON' ) SRC
left join #DWH_TABLE_SCHEMA.d_configuration_item TRGT
ON (SRC.requestid=TRGT.row_id  
AND SRC.SourceInstance =TRGT.source_id )
where coalesce(SRC.site,'')<>coalesce(TRGT.location)