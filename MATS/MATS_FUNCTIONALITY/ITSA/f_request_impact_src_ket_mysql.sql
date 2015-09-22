





select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH data validation failed between request_final and f_request: impact_src_ket' else 'SUCCESS' end as Message;
select sys_id from <<tenant>>_mdsdb.sc_request_final S
join app_test.lsm_ls_source_timezone L 
on(S.sourceinstance  = L.sourceid )

left join d_lov_task_impact_view TI
on (TI.src_rowid = concat('IMPACT~TASK~~~',upper(S.impact)) )

where CRC32(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
coalesce(TI.row_key,case when S.impact is not null then -1 else 0 end))
) not in (
select CRC32(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.impact_src_key,''))
) from <<tenant>>_mdwdb.f_request DWH);

