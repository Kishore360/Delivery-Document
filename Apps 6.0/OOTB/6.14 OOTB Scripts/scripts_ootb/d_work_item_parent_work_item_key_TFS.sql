SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.parent_work_item_key' ELSE 'SUCCESS' END as Message
 
/*select TRGT.row_id, TRGT.row_key, fhist.TargetWorkItemID, SRC.TeamProjectSK, SRC.system_workitemtype,
CONCAT(fhist.TargetWorkItemID, '~', SRC.TeamProjectSK) conct,
coalesce(LKP.row_key, case when CONCAT(fhist.TargetWorkItemID, '~', SRC.TeamProjectSK) is null then 0 else -1 end) expc, 
coalesce(TRGT.parent_work_item_key,'') actl*/
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
 
left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 ON CONCAT(SRC.System_Id, '~', SRC.TeamProjectSK)=TRGT.row_id 
 and SRC.sourceinstance=TRGT.source_id
 
left join (
select hist.SourceWorkItemID, hist.TeamProjectCollectionSK, hist.RemovedByPersonSK, hist.TargetWorkItemID, lm.dimension_code, lm.dimension_wh_code
from #MDS_TABLE_SCHEMA.factworkitemlinkhistory_final hist
join #DWH_TABLE_SCHEMA.d_lov_map lm
on lm.src_rowid = concat('LINK_TYPE~WORK_ITEM~',hist.WorkItemLinkTypeSK)
where lm.dimension_wh_code = 'PARENT' and hist.RemovedByPersonSK is null
) fhist
on fhist.SourceWorkItemID = SRC.System_Id and fhist.TeamProjectCollectionSK = SRC.TeamProjectCollectionSK 

left join #DWH_TABLE_SCHEMA.d_work_item LKP
 ON CONCAT(fhist.TargetWorkItemID, '~', SRC.TeamProjectSK)  = LKP.row_id
 and SRC.sourceinstance = LKP.source_id
 
 where coalesce(LKP.row_key, case when CONCAT(fhist.TargetWorkItemID, '~', SRC.TeamProjectSK) is null then 0 else -1 end)<>coalesce(TRGT.parent_work_item_key,'');