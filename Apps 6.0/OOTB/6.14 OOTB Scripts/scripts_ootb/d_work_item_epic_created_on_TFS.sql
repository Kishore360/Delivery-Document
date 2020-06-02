SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item_epic.created_on' ELSE 'SUCCESS' END as Message

/*select TRGT.row_id, TRGT.row_key,SRC.system_createddate,
coalesce(convert_tz(SRC.system_createddate, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'') expc,
coalesce(convert_tz(SRC.system_createddate, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),'') expc_rvs,
coalesce(TRGT.created_on,'') actl*/
FROM (
 select SRCD.*-- , SRCF.microsoft_vsts_scheduling_originalestimate-- , SRCF.microsoft_vsts_scheduling_remainingwork-- , SRCF.microsoft_vsts_scheduling_completedwork-- , SRCF.LastUpdatedDateTime lstupdt
 from 
 #MDS_TABLE_SCHEMA.dimworkitem_final SRCD
 
 where upper(SRCD.system_workitemtype) = 'EPIC' and SRCD.system_rev=1
 ) SRC
 
left join #DWH_TABLE_SCHEMA.d_work_item_epic TRGT
 ON CONCAT(SRC.system_id, '~', SRC.teamprojectsk)=TRGT.row_id 
 and SRC.sourceinstance=TRGT.source_id
 
 where TRGT.row_key not in (0,-1) and TRGT.soft_deleted_flag = 'N' and
 coalesce(convert_tz(SRC.system_createddate, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.created_on,'')