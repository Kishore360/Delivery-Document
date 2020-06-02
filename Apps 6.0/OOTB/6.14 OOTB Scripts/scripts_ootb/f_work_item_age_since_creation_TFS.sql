SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.age_since_creation' ELSE 'SUCCESS' END as Message
FROM (
 select SRCD.*, SRCF.microsoft_vsts_scheduling_originalestimate, SRCF.microsoft_vsts_scheduling_remainingwork, SRCF.microsoft_vsts_scheduling_completedwork, SRCF.LastUpdatedDateTime lstupdt
 from #MDS_TABLE_SCHEMA.factcurrentworkitem_final SRCF
 left join #MDS_TABLE_SCHEMA.dimworkitem_final SRCD
 on SRCF.workitemsk = SRCD.workitemsk 
 join 
 ( 
 select base.system_id, base.teamprojectsk, base.sourceinstance,max(base.System_Rev) System_Rev 
 from #MDS_TABLE_SCHEMA.dimworkitem_final base 
 group by base.system_id, base.teamprojectsk, base.sourceinstance 
 ) curr 
 on SRCD.system_id = curr.system_id and SRCD.teamprojectsk = curr.teamprojectsk 
 and SRCD.sourceinstance = curr.sourceinstance and SRCD.system_rev = curr.system_rev
 ) SRC
  
 join (SELECT source_id, CONVERT_TZ(max(lastupdated),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') AS lastupdated 
 FROM #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE sourcename = 'TFS_DWS' group by source_id) odf on odf.source_id = SRC.sourceinstance
 
 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on CONCAT(SRC.system_id, '~', SRC.teamprojectsk)=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 left join #DWH_TABLE_SCHEMA.d_lov_map LM
 on LM.row_id = concat('STATUS~WORK_ITEM~', SRC.System_State) and LM.dimension_class = 'STATUS~WORK_ITEM'

 where TRGT.soft_deleted_flag = 'N' and 
 coalesce(case when LM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then timestampdiff(second,coalesce(SRC.system_createddate,0), coalesce(SRC.microsoft_vsts_common_resolveddate, SRC.microsoft_vsts_common_closeddate))
 else timestampdiff(second,coalesce(SRC.system_createddate,0), coalesce(odf.lastupdated,0))  end,0) <>coalesce(TRGT.age_since_creation,'')