





select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH data validation failed between incident_final and f_incident: impact_src_ket' else 'SUCCESS' end as Message;
select sys_id from <<tenant>>_mdsdb.incident_final S
join app_test.lsm_ls_source_timezone L 
on(convert(S.sourceinstance using utf8)  = convert(L.sourceid using utf8))

left join d_lov_task_impact_view TI
on (convert(TI.src_rowid using utf8) = convert(concat('IMPACT~TASK~~~',upper(S.impact)) using utf8))

where CRC32(convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
coalesce(TI.row_key,case when S.impact is not null then -1 else 0 end)
using utf8)) not in (
select CRC32(convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.impact_src_key,''))
using utf8)) from <<tenant>>_mdwdb.f_incident DWH);

