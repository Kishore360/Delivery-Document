select 
case 
when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'
when sum(src_not_null_count) <> 0 and sum(lkp_not_null_count) = 0 then 'Failed. Lookup does not have any data.'
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))
when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) >= 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. Few (sys_id || priority) - ',group_concat(distinct warnings))
when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) < 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. (sys_id || priority) : ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))
else CONCAT('Success. All warehouse records are matching with source. Source Count - ',sum(src_not_null_count),' Target Count - ',sum(trgt_not_null_count)) end Result
from  
(select 
case when src.priority is not null then 1 else 0 end as src_not_null_count,
case when trgt.priority_src_key is not null and trgt.priority_src_key <> 0 then 1 else 0 end as trgt_not_null_count,
case when lkp.row_key is not null then 1 else 0 end as lkp_not_null_count,
case when src.priority is not null and lkp.row_id is null then concat(src.sys_id,' || ',src.priority) else '' end as warnings,
case when src.priority is not null and lkp.row_id is null then 1 else 0 end as warnings_cnt,
case when COALESCE(lkp.row_key,CASE WHEN src.priority IS NULL THEN 0 else -1 end) <> COALESCE(trgt.priority_src_key,0)  then src.sys_id else '' end as failures,
case when COALESCE(lkp.row_key,CASE WHEN src.priority IS NULL THEN 0 else -1 end) <> COALESCE(trgt.priority_src_key,0) then 1 else 0 end as failures_cnt
from cardinalhealth_mdsdb.u_enhancement_task_final src 
left join cardinalhealth_mdwdb.d_enhancement_task_c trgt on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
left join cardinalhealth_mdwdb.d_lov lkp on lkp.row_id = CONCAT('PRIORITY_C~ENHANCEMENT_TASK~~~',src.priority) and lkp.source_id = src.sourceinstance)fnl;