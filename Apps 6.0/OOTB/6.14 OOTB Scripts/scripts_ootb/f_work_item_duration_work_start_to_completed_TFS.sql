SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.duration_work_start_to_completed' ELSE 'SUCCESS' END as Message
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
  
join (SELECT source_id, CONVERT_TZ(max(lastupdated),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') AS lastupdated FROM #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE sourcename = 'TFS_DWS' group by source_id) odf on odf.source_id = SRC.sourceinstance
 
 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on CONCAT(SRC.system_id, '~', SRC.teamprojectsk)=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 left join
( 
select S.system_id, S.teamprojectsk, min(S.system_changeddate) inprog_strtdt, max(S.system_changeddate) inprog_enddt
from #MDS_TABLE_SCHEMA.dimworkitem_final S
 left join #DWH_TABLE_SCHEMA.d_lov_map CLM
 on CLM.dimension_code = S.System_State and CLM.dimension_class = 'STATUS~WORK_ITEM'
 where CLM.dimension_wh_code in ('IN PROGRESS')
 group by S.system_id, S.teamprojectsk
) inprog_dt
on inprog_dt.system_id = SRC.system_id and inprog_dt.teamprojectsk = SRC.teamprojectsk

 left join #DWH_TABLE_SCHEMA.d_lov_map LM
 on LM.row_id = concat('STATUS~WORK_ITEM~', SRC.System_State) and LM.dimension_class = 'STATUS~WORK_ITEM' and LM.source_id = SRC.sourceinstance
 
 where TRGT.soft_deleted_flag = 'N' and
 coalesce(timestampdiff(second,coalesce(inprog_dt.inprog_strtdt,0),coalesce(SRC.microsoft_vsts_common_closeddate,0)),0) <>coalesce(TRGT.duration_work_start_to_completed,'');