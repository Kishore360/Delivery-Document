SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.age_since_in_progress' ELSE 'SUCCESS' END as Message
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
select S.system_id, S.teamprojectsk, min(system_changeddate) inprog_strtdt, max(system_changeddate) inprog_enddt
from (
 select DWI.*, SQ.prev_state as prev_state, SQ.current_state as current_state
 from #MDS_TABLE_SCHEMA.dimworkitem_final DWI
 join 
 (
select base.system_id, base.teamprojectsk, base.sourceinstance, prev.System_State prev_state, base.System_State current_state, /*next.System_State next_state,*/ base.System_Rev sys_rev
 from #MDS_TABLE_SCHEMA.dimworkitem_final base 
 left join #MDS_TABLE_SCHEMA.dimworkitem_final next
 on base.system_id = next.system_id and base.teamprojectsk = next.teamprojectsk 
 and base.sourceinstance = next.sourceinstance and base.system_rev + 1 = next.system_rev and next.System_State!=base.System_State
 left join #MDS_TABLE_SCHEMA.dimworkitem_final prev
 on base.system_id = prev.system_id and base.teamprojectsk = prev.teamprojectsk 
 and base.sourceinstance = prev.sourceinstance and base.system_rev = prev.system_rev + 1 and prev.System_State!=base.System_State
 where prev.System_State is not null 
 union all
 select base.system_id, base.teamprojectsk, base.sourceinstance, null as prev_state, base.System_State current_state, /*next.System_State next_state,*/ base.System_Rev sys_rev
 from #MDS_TABLE_SCHEMA.dimworkitem_final base 
 where base.System_Rev = 1
 ) SQ
 on SQ.System_Id = DWI.System_Id and SQ.TeamProjectSK = DWI.TeamProjectSK 
 and SQ.current_state = DWI.System_State and SQ.sys_rev = DWI.System_Rev
 ) S
 left join #DWH_TABLE_SCHEMA.d_lov_map CLM
 on CLM.dimension_code = S.System_State and CLM.dimension_class = 'STATUS~WORK_ITEM'
 where CLM.dimension_wh_code in ('IN PROGRESS')
 group by S.system_id, S.teamprojectsk
) inprog_dt
on inprog_dt.system_id = SRC.system_id and inprog_dt.teamprojectsk = SRC.teamprojectsk

 left join #DWH_TABLE_SCHEMA.d_lov_map LM
 on LM.row_id = concat('STATUS~WORK_ITEM~', SRC.System_State) and LM.dimension_class = 'STATUS~WORK_ITEM'
 
  where coalesce(case when LM.dimension_wh_code in ('PROPOSED', 'REMOVED') then 0
  when LM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then timestampdiff(second,coalesce(inprog_dt.inprog_strtdt,SRC.System_CreatedDate), coalesce(SRC.microsoft_vsts_common_resolveddate, SRC.microsoft_vsts_common_closeddate))
  else timestampdiff(second,coalesce(inprog_dt.inprog_strtdt,0), coalesce(odf.lastupdated,0))  end,0) <>coalesce(TRGT.age_since_in_progress,'');