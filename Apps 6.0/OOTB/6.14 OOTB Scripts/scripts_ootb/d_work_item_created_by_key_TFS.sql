SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.created_by_key' ELSE 'SUCCESS' END as Message
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
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (CONCAT(SRC.system_id, '~', SRC.teamprojectsk)=TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',SRC.system_createdby__personsk) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE TRGT.row_key not in (0,-1) and TRGT.soft_deleted_flag = 'N' and
COALESCE(LKP.row_key,CASE WHEN SRC.system_createdby__personsk IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.created_by_key ,'');