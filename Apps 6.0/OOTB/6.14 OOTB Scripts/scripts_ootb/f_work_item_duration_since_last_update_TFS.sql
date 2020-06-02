SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.duration_since_last_update' ELSE 'SUCCESS' END as Message
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
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item DIM 
 on DIM.row_key = TRGT.work_item_key
join (SELECT source_id, max(lastupdated) AS lastupdated FROM #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE sourcename = 'TFS_DWS' group by source_id) odf
 on SRC.sourceinstance=odf.source_id
 join #DWH_TABLE_SCHEMA.d_lov_map LKP
 on LKP.row_key = DIM.work_item_status_src_key
 WHERE TRGT.soft_deleted_flag = 'N' and
 COALESCE(case when LKP.dimension_wh_code in ('RESOLVED' , 'COMPLETED') then 0 else timestampdiff(second, odf.lastupdated, CONVERT_TZ(SRC.lstupdt,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) end, 0)<> COALESCE(TRGT.duration_since_last_update,'');