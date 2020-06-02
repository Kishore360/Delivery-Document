SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.time_until_due_date' ELSE 'SUCCESS' END as Message
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
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( CONCAT('STATUS','~','WORK_ITEM','~',UPPER(SRC.system_state)) = LKP.src_rowid )
 
 where coalesce(case when LKP.dimension_wh_code in ('COMPLETED', 'RESOLVED') then 0
 when TIMESTAMPDIFF(second,odf.lastupdated,SRC.microsoft_vsts_scheduling_duedate)<0 THEN 0
 else TIMESTAMPDIFF(second,odf.lastupdated,coalesce(SRC.microsoft_vsts_scheduling_duedate,0)) end,0) <> coalesce(TRGT.time_until_due_date,'');