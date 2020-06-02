select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_geography.COUNTRY_NAME' ELSE 'SUCCESS' END as Message
-- select coalesce(SRC.country,''),coalesce(TRGT.COUNTRY_NAME,'')
from(select * from #MDS_TABLE_SCHEMA.cmn_location_final where cdctype<>'D')SRC
left join (select * from #DWH_TABLE_SCHEMA.d_geography where soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and SRC.sys_id=TRGT.row_id
where coalesce(SRC.country,'')<>coalesce(TRGT.COUNTRY_NAME,'')