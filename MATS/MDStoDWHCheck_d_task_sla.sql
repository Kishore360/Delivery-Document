


select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for contract_sla_final to d_task_sla' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.contract_sla_final S
join app_test.lsm_ls_source_timezone L  
on (convert(S.sourceinstance using utf8) = convert(L.sourceid using utf8))

left join d_domain DMN
on (convert(DMN.row_id using utf8) = convert(S.sys_domain using utf8)
and convert(DMN.source_id using utf8) = convert((case when S.sys_domain is null then 0 else S.sourceinstance end) using utf8))

where CRC32(convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(S.name,''),
ifnull(S.start_condition,''),
ifnull(S.duration_type,''),
ifnull(timestampdiff(second,'1970-01-01 00:00:00',S.duration),''),
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''),
ifnull(DMN.row_key,'-1'),
case when S.active = 1 then 'Y' else 'N' end,
case when (S.name) like '%resolution%' then 'resolution' else(case when lower(S.name) like '%response%' then 'response' else '' end) end)
using utf8)) not in (
select CRC32(convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.sla_name,''),
ifnull(DWH.sla_condition,''),
ifnull(DWH.duration_type,''),
ifnull(DWH.sla_duration,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,''),
ifnull(DWH.domain_key,''),
ifnull(DWH.active_flag,''),
ifnull(DWH.sla_category,''))
using utf8)) from <<tenant>>_mdwdb.d_task_sla DWH);
