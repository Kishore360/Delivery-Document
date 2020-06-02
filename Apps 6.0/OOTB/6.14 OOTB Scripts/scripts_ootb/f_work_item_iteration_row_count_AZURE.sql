
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_work_item_iteration.row_count' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(*) count_src from (select 
distinct rev.workItemKey,
rev.newValue,
rev.organizationKey,
concat(rev.workItemKey,'~',rev.newValue,'~',rev.organizationKey) as sys_id,
rev.newValueKey,
rev.sourceinstance
from #MDS_TABLE_SCHEMA.azure_workitem_update_final rev where rev.cdctype<>'D' and rev.fieldName = 'iterationIdKey') SRC) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.f_work_item_iteration TRGT 
 join (select * from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Azure_Tenant' and soft_deleted_flag <> 'Y') ODF on ODF.source_id = TRGT.source_id
 where TRGT.row_key not in (0, -1) and TRGT.soft_deleted_flag <> 'Y') count_trgt
 where count_src.count_src <> count_trgt.count_trgt
 )SQ;