select 
case 

when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else CONCAT('Success. All warehouse records are matching with source. Source Count : ',sum(src_not_null_count),'  Target Count : ',sum(trgt_not_null_count)) end Result

from 
(select 
case when src.work_start is not null and src.work_end is not null then 1 else 0 end as src_not_null_count,

case when trgt.business_duration is not null  then 1 else 0 end as trgt_not_null_count,

case when COALESCE(case when work_start is null or work_end is null then null when timestampdiff(second,work_start,work_end)<0 then 0 else timestampdiff(second,work_start,work_end) end ,0) <> COALESCE(trgt.work_start_to_end_duration,0) then src.sys_id else '' end as failures,

case when COALESCE(case when work_start is null or work_end is null then null when timestampdiff(second,work_start,work_end)<0 then 0 else timestampdiff(second,work_start,work_end) end,0) <> COALESCE(trgt.work_start_to_end_duration,0) then 1 else 0 end as failures_cnt

from cardinalhealth_mdsdb.u_enhancement_task_final src
left join cardinalhealth_mdwdb.f_enhancement_task_c trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance) fnl ;