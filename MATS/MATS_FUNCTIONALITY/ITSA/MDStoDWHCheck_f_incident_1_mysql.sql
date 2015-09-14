


select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed between incident_final and f_incident' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.incident_final S
join app_test.lsm_ls_source_timezone L 
on(S.sourceinstance  = L.sourceid )

left join d_calendar_date DCD_OPN
on (DCD_OPN.row_id = date_format(convert_tz(S.opened_at,source_time_zone,target_time_zone),'%Y%m%d') ) and DCD_OPN.source_id=0

left join d_calendar_time DCT_OPN
on (DCT_OPN.row_id = date_format(convert_tz(S.opened_at,source_time_zone,target_time_zone),'%H%i') ) and DCT_OPN.source_id=0

left join d_party DPV
on (DPV.row_id = concat('INTERNAL_CONTACT~',S.caller_id) )

left join d_internal_organization EDV
on (EDV.emp_row_id = concat('INTERNAL_CONTACT~',S.caller_id) )

left join d_location DL
on (DL.row_id = S.location )

left join d_configuration_item DCI
on (DCI.row_id = S.cmdb_ci )

left join d_internal_organization DIO_AG
on (DIO_AG.row_id = S.assignment_group 
and DIO_AG.group_flag = 'Y')

where CRC32(concat(
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
) not in (
select CRC32(concat(
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
) from <<tenant>>_mdwdb.f_incident DWH);
