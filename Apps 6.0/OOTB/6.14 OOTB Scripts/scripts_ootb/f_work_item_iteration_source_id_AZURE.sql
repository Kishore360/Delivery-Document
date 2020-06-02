SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_iteration.source_id' ELSE 'SUCCESS' END as Message
/* select COALESCE(concat(id,'~',SRC.IterationId),'') , COALESCE(TRGT.row_id,'') */
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
where TRGT.soft_deleted_flag <> 'Y' and 
COALESCE(SRC.sourceinstance,'') <> COALESCE(TRGT.source_id,'')