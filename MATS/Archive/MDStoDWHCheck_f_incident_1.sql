


select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed between incident_final and f_incident' else 'SUCCESS' end as Message
from #MDS_TABLE_SCHEMA.incident_final S
join app_test.lsm_ls_source_timezone L 
on(convert(S.sourceinstance using utf8)  = convert(L.sourceid using utf8))

left join d_calendar_date DCD_OPN
on (convert(DCD_OPN.row_id using utf8) = convert(date_format(convert_tz(S.opened_at,source_time_zone,target_time_zone),'%Y%m%d') using utf8)) and DCD_OPN.source_id=0

left join d_calendar_time DCT_OPN
on (convert(DCT_OPN.row_id using utf8) = convert(date_format(convert_tz(S.opened_at,source_time_zone,target_time_zone),'%H%i') using utf8)) and DCT_OPN.source_id=0

left join d_party DPV
on (convert(DPV.row_id using utf8) = convert(concat('INTERNAL_CONTACT~',S.caller_id) using utf8))

left join d_internal_organization EDV
on (convert(EDV.emp_row_id using utf8) = convert(concat('INTERNAL_CONTACT~',S.caller_id) using utf8))

left join d_location DL
on (convert(DL.row_id using utf8) = convert(S.location using utf8))

left join d_configuration_item DCI
on (convert(DCI.row_id using utf8) = convert(S.cmdb_ci using utf8))

left join d_internal_organization DIO_AG
on (convert(DIO_AG.row_id using utf8) = convert(S.assignment_group using utf8)
and DIO_AG.group_flag = 'Y')

where CRC32(convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(S.number,''),
coalesce(DCD_OPN.row_key,case when S.opened_at is not null then -1 else 0 end),
coalesce(DCT_OPN.row_key,case when S.opened_at is not null then -1 else 0 end),
coalesce(DPV.row_key,case when S.caller_id is not null then -1 else 0 end),
coalesce(EDV.row_key,case when S.caller_id is not null then -1 else 0 end),
coalesce(DL.row_key,case when S.location is not null then -1 else 0 end),
coalesce(DCI.row_key,case when S.cmdb_ci is not null then -1 else 0 end),
coalesce(DIO_AG.row_key, case when S.assignment_group is not null then -1 else 0 end))
using utf8)) not in (
select CRC32(convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.incident_number,''),
ifnull(DWH.opened_on_key,''),
ifnull(DWH.opened_time_key,''),
ifnull(DWH.opened_by_key,''),
ifnull(DWH.opened_by_department_key,''),
ifnull(DWH.location_key,''),
ifnull(DWH.configuration_item_key,''),
ifnull(DWH.assignment_group_key,''))
using utf8)) from #TABLE_SCHEMA.f_incident DWH);
