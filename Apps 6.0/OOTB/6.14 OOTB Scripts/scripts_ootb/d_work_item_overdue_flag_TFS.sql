SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.overdue_flag' ELSE 'SUCCESS' END as Message
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
 
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) FRESH  
 ON(FRESH.source_id=SRC.sourceinstance)
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 ON CONCAT(SRC.system_id, '~', SRC.teamprojectsk)=TRGT.row_id 
 and SRC.sourceinstance=TRGT.source_id
 
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on TRGT.work_item_status_src_key= LM.src_key

 where TRGT.row_key not in (0,-1) and TRGT.soft_deleted_flag = 'N' and
 coalesce(CASE when (LM.dimension_wh_code in ('RESOLVED','COMPLETED') and coalesce(TRGT.RESOLVED_ON,TRGT.completed_on,0)>coalesce(TRGT.DUE_ON,0) and TRGT.DUE_ON is not null) THEN 'Y' 
 WHEN (TRGT.in_progress_flag = 'Y' and coalesce(TRGT.DUE_ON,0) < FRESH.lastupdated and TRGT.DUE_ON is not null) THEN 'Y' ELSE 'N' END,'N') <> coalesce(TRGT.overdue_flag ,'')