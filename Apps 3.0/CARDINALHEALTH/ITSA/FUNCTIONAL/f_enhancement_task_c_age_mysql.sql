select 
case 
when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))
else CONCAT('Success. All warehouse records are matching with source. Source Count : ',sum(src_not_null_count),'  Target Count : ',sum(trgt_not_null_count)) end Result
from 
(select 
case when src.age is not null then 1 else 0 end as src_not_null_count,
case when trgt.age is not null then 1 else 0 end as trgt_not_null_count,
case when COALESCE(src.age,0) <> COALESCE(trgt.age,0) then src.sys_id else '' end as failures,
case when COALESCE(src.age,0) <> COALESCE(trgt.age,0) then 1 else 0 end as failures_cnt
from
(select 
src.sys_id,src.sourceinstance,
case 
when lv_mp.dimension_wh_code = 'CLOSED' then COALESCE(case when timestampdiff(second,convert_tz(convert_tz(src.opened_at,'UTC','America/New_York'),'America/New_York','UTC'),convert_tz(convert_tz(COALESCE(src.closed_at,src.sys_updated_on),'UTC','America/New_York'),'America/New_York','UTC')) <= 0 then 0 else timestampdiff(second,convert_tz(convert_tz(src.opened_at,'UTC','America/New_York'),'America/New_York','UTC'),convert_tz(convert_tz(COALESCE(src.closed_at,src.sys_updated_on),'UTC','America/New_York'),'America/New_York','UTC')) end ,0)
when lv_mp.dimension_wh_code = 'OPEN' then COALESCE(case when timestampdiff(second,convert_tz(convert_tz(src.opened_at,'UTC','America/New_York'),'America/New_York','UTC'),lastupdated) <=0 then 0 else timestampdiff(second,convert_tz(convert_tz(src.opened_at,'UTC','America/New_York'),'America/New_York','UTC'),lastupdated) end ,0)
else 0 end as age
from cardinalhealth_mdsdb.u_enhancement_task_final src
inner join cardinalhealth_mdwdb.d_enhancement_task_c d_trgt on src.sys_id = d_trgt.row_id and src.sourceinstance = d_trgt.source_id
left join cardinalhealth_mdwdb.d_lov_map lv_mp on d_trgt.state_src_key = lv_mp.src_key and lv_mp.dimension_class = 'STATE_C~ENHANCEMENT_TASK' -- and lv_mp.dimension_wh_code = 'CLOSED'
left join (select source_id,convert_tz(max(lastupdated),'America/New_York','UTC') as lastupdated from cardinalhealth_mdwdb.d_o_data_freshness group by source_id) odf on src.sourceinstance = odf.source_id ) src 
left join cardinalhealth_mdwdb.f_enhancement_task_c trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance) fnl ;