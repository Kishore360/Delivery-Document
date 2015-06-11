





select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH data validation failed between request_final and f_request.opened_on_key: opened_on_opened_time_key.opened_on_key' else 'SUCCESS' end as Message
from #MDS_TABLE_SCHEMA.sc_request_final S
join app_test.lsm_ls_source_timezone L 
on(convert(S.sourceinstance using utf8)  = convert(L.sourceid using utf8))

left join d_calendar_date DCD_OPN
on (convert(DCD_OPN.row_id using utf8) = convert(date_format(convert_tz(S.opened_at,source_time_zone,target_time_zone),'%Y%m%d') using utf8)) and DCD_OPN.source_id=0

left join d_calendar_time DCT_OPN
on (convert(DCT_OPN.row_id using utf8) = convert(date_format(convert_tz(S.opened_at,source_time_zone,target_time_zone),'%H%i') using utf8)) and DCT_OPN.source_id=0

where CRC32(convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
coalesce(DCD_OPN.row_key,case when S.opened_at is not null then -1 else 0 end),
coalesce(DCT_OPN.row_key,case when S.opened_at is not null then -1 else 0 end))
using utf8)) not in (
select CRC32(convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.opened_on_key,''),
ifnull(DWH.opened_time_key,''))
using utf8)) from #TABLE_SCHEMA.f_request DWH);
