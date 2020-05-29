SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.work_item_updated_by' ELSE 'SUCCESS' END as Message
FROM (
 select SRCD.*, SRCF.microsoft_vsts_scheduling_originalestimate, SRCF.microsoft_vsts_scheduling_remainingwork, SRCF.microsoft_vsts_scheduling_completedwork
 from #MDS_TABLE_SCHEMA.factcurrentworkitem_final SRCF
 left join #MDS_TABLE_SCHEMA.dimworkitem_final SRCD
 on SRCF.workitemsk = SRCD.workitemsk
 ) SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (CONCAT(SRC.system_id, '~', SRC.teamprojectsk)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',SRC.System_ChangedBy__PersonSK) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.full_name,'')<> COALESCE(TRGT.work_item_updated_by ,'');