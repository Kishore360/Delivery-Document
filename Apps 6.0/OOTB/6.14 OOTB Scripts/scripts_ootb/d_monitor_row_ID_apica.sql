SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_monitor.row_ID' ELSE 'SUCCESS' END as Message
 FROM (select 
checks.cdctype as cdctype, 
checks.id as entity_ID,
checks.name as name
,checks.id as row_ID,
CASE WHEN checks.cdctype = 'D' THEN 'Y' ELSE 'N' END as soft_deleted_flag
,checks.check_type_name as type
, checks.sourceinstance as source_id
from #MDS_TABLE_SCHEMA.checks_final checks) SRC
 left join #DWH_TABLE_SCHEMA.d_monitor TRGT
on SRC.row_ID=TRGT.row_id
and SRC.source_id=TRGT.source_id 
 where coalesce(SRC.row_ID,'')<>coalesce(TRGT.row_ID,'');