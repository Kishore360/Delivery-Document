SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_iteration.work_item_iteration_m2m_key' ELSE 'SUCCESS' END as Message
/* TRGT.row_id, TRGT.row_key, SRC.sys_id , 
COALESCE(LKP.row_key,case when SRC.newValueKey is null then 0 else -1 end ,'') sr, COALESCE(TRGT.work_item_iteration_m2m_key,'') tg */
FROM (select 
rev.workItemKey,
rev.newValue,
rev.organizationKey,
concat(rev.workItemKey,'~',rev.newValue,'~',rev.organizationKey) as sys_id,
temp.projectKey,
rev.newValueKey,
rev.sourceinstance,
rev.cdctype,
rev.revisedByKey,
rev.revisedDate
from #MDS_TABLE_SCHEMA.azure_workitem_update_final rev 
left join #STG_TABLE_SCHEMA.workitem_temp_azure temp
on rev.workItemKey = temp.__numerify__primary_key and rev.sourceinstance = temp.sourceinstance
where rev.cdctype <> 'D' and temp.cdctype <> 'D' and rev.fieldName = 'iterationIdKey') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_iteration TRGT
ON SRC.sys_id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_iteration LKP
ON concat(SRC.newValue,'~',SRC.organizationKey) = LKP.row_id and SRC.sourceinstance = LKP.source_id
where TRGT.soft_deleted_flag <> 'Y' and COALESCE(LKP.row_key,case when SRC.newValueKey is null then 0 else -1 end ,'') <> COALESCE(TRGT.work_item_iteration_m2m_key,'')
