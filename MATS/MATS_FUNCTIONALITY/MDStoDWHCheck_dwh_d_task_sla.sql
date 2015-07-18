
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for contract_sla_final to dwh_d_task_sla' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.contract_sla_final S
join <<tenant>>_mdwdb.lsm_ls_source_timezone L  
on (S.sourceinstance = L.sourceid )

left join dwh_d_domain DMN
on (DMN.row_id = S.sys_domain 
and DMN.source_id = (case when S.sys_domain is null then 0 else S.sourceinstance end) )

where CRC32(concat(
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
) not in (
select CRC32(concat(
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
) from <<tenant>>_mdwdb.dwh_d_task_sla DWH);
