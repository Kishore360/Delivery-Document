SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.is_active_flag' ELSE 'SUCCESS' END as Message
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
 
LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (CONCAT(SRC.system_id, '~', SRC.teamprojectsk) = TRGT.row_id
 AND SRC.sourceinstance=TRGT.source_id )

 left join #DWH_TABLE_SCHEMA.d_lov_map LM
 on LM.dimension_code = S.System_State and LM.dimension_class = 'STATUS~WORK_ITEM'
 
WHERE coalesce(case when LM.dimension_wh_code not in ('COMPLETED', 'RESOLVED') then 'Y' else 'N' end, 'N') <> coalesce(TRGT.is_active_flag,'');