SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.soft_deleted_flag' ELSE 'SUCCESS' END as Message
 -- select TRGT.row_id, SRC.source_id,TRGT.source_id
  FROM (select 
MAX(checks.cdctype)  as cdctype, 
-- checks.id as entity_ID,
MAX(checks.location) as location_name
,checks.location as row_ID,
MAX(CASE WHEN checks.cdctype = 'D' THEN 'Y' ELSE 'N' END) as soft_deleted_flag
-- ,checks.check_type as type 
, MAX(checks.sourceinstance) as source_id
from #MDS_TABLE_SCHEMA.checks_final checks
group by row_ID ) SRC
 left join #DWH_TABLE_SCHEMA.d_location TRGT
on SRC.row_ID=TRGT.row_id  collate utf8_unicode_ci
and SRC.source_id=TRGT.source_id -- collate utf8_unicode_ci
 where coalesce(SRC.soft_deleted_flag,'')<>coalesce(TRGT.soft_deleted_flag,'') -- collate utf8_unicode_ci;
 
 -- select * from #DWH_TABLE_SCHEMA.d_location