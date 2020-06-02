select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_geography.state_code' ELSE 'SUCCESS' END as Message
-- select TRGT.state_code
from(select * from #MDS_TABLE_SCHEMA.cmn_location_final where cdctype<>'D')SRC
left join (select * from #DWH_TABLE_SCHEMA.d_geography where soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and SRC.sys_id=TRGT.row_id
where TRGT.state_code is not null;