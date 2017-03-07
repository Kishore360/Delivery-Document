select 
case 
when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))
else CONCAT('Success. All warehouse records are matching with source. Source Count : ',sum(src_not_null_count),' ; Target Count : ',sum(trgt_not_null_count)) end Result
from 
(select 
case when src.open_to_close_duration is not null then 1 else 0 end as src_not_null_count,
case when trgt.open_to_close_duration is not null then 1 else 0 end as trgt_not_null_count,
case when COALESCE(src.open_to_close_duration,0) <> COALESCE(trgt.open_to_close_duration,0) then src.sys_id else '' end as failures,
case when COALESCE(src.open_to_close_duration,0) <> COALESCE(trgt.open_to_close_duration,0) then 1 else 0 end as failures_cnt
from
(select 
src.sys_id,src.sourceinstance,
case 
when lv_mp.dimension_wh_code = 'CLOSED' then COALESCE(case when timestampdiff(second,convert_tz(convert_tz(src.opened_at,'UTC','America/New_York'),'America/New_York','UTC'),convert_tz(convert_tz(COALESCE(src.closed_at,src.sys_updated_on),'UTC','America/New_York'),'America/New_York','UTC')) <= 0 then 0 else timestampdiff(second,convert_tz(convert_tz(src.opened_at,'UTC','America/New_York'),'America/New_York','UTC'),convert_tz(convert_tz(COALESCE(src.closed_at,src.sys_updated_on),'UTC','America/New_York'),'America/New_York','UTC')) end ,0)
else 0 end as open_to_close_duration
from cardinalhealth_mdsdb.u_enhancement_task_final src
inner join cardinalhealth_mdwdb.d_enhancement_task_c d_trgt on src.sys_id = d_trgt.row_id and src.sourceinstance = d_trgt.source_id
left join cardinalhealth_mdwdb.d_lov_map lv_mp on d_trgt.state_src_key = lv_mp.src_key and lv_mp.dimension_class = 'STATE_C~ENHANCEMENT_TASK' ) src 
left join cardinalhealth_mdwdb.f_enhancement_task_c trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance) fnl ;