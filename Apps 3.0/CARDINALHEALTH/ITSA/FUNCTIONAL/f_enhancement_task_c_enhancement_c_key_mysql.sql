select 
case 
when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'
when sum(src_not_null_count) <> 0 and sum(lkp_not_null_count) = 0 then 'Failed. Lookup does not have any data.'
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))
when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) >= 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. Few (sys_id || parent) - ',group_concat(distinct warnings))
when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) < 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. (sys_id || parent) : ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))
else CONCAT('Success. All warehouse records are matching with source. Source Count - ',sum(src_not_null_count),' Target Count - ',sum(trgt_not_null_count)) end Result
from  
(select 
case when src.parent is not null then 1 else 0 end as src_not_null_count,
case when trgt.enhancement_c_key is not null and trgt.enhancement_c_key <> 0 then 1 else 0 end as trgt_not_null_count,
case when lkp.row_key is not null then 1 else 0 end as lkp_not_null_count,
case when src.parent is not null and lkp.row_id is null then concat(src.sys_id,' || ',src.parent) else '' end as warnings,
case when src.parent is not null and lkp.row_id is null then 1 else 0 end as warnings_cnt,
case when COALESCE(lkp.row_key,CASE WHEN src.parent IS NULL THEN 0 else -1 end) <> COALESCE(trgt.enhancement_c_key,0)  then src.sys_id else '' end as failures,
case when COALESCE(lkp.row_key,CASE WHEN src.parent IS NULL THEN 0 else -1 end) <>  COALESCE(trgt.enhancement_c_key,0) then 1 else 0 end as failures_cnt
from cardinalhealth_mdsdb.u_enhancement_task_final src 
left join cardinalhealth_mdwdb.f_enhancement_task_c trgt on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
left join cardinalhealth_mdwdb.d_enhancement_rm_c lkp on lkp.row_id = src.parent and lkp.source_id = src.sourceinstance)fnl;