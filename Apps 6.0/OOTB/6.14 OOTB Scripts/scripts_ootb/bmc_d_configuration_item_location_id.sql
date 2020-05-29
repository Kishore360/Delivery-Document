SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.department_id' ELSE 'SUCCESS' END as Message
  FROM(select TRGT.row_id -- , TRGT.location_key, LKP.row_key
from #MDS_TABLE_SCHEMA.hlx_bmc_core_baseelement_final SRC
left join #DWH_TABLE_SCHEMA.d_configuration_item TRGT
on TRGT.row_id = SRC.requestid
and TRGT.source_id = SRC.sourceinstance
left join #MDS_TABLE_SCHEMA.bmc_sit_site_final SRC_LKP
on SRC.site = SRC_LKP.site
and SRC_LKP.sourceinstance = SRC.sourceinstance
left join #DWH_TABLE_SCHEMA.d_location LKP
on LKP.row_id = SRC_LKP.site_id
and LKP.source_id = SRC_LKP.sourceinstance
where SRC.datasetid = 'BMC.ASSET' and SRC.classid <> 'BMC_PERSON'
and coalesce(LKP.row_key, case when SRC_LKP.site_id is not null then -1 else 0 end) <> coalesce(TRGT.location_key, ''))sq
