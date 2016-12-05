select 
case 

when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else CONCAT('Success. All warehouse records are matching with source. Source Count : ',sum(src_not_null_count),' ; Target Count : ',sum(trgt_not_null_count)) end Result

from 
(select 
case when src.valid_to is not null then 1 else 0 end as src_not_null_count,

case when trgt.valid_to is not null then 1 else 0 end as trgt_not_null_count,

case when COALESCE(src.valid_to,'1970-01-01') <> COALESCE(trgt.valid_to,'1970-01-01') then src.sys_id else '' end as failures,

case when COALESCE(src.valid_to,'1970-01-01') <> COALESCE(trgt.valid_to,'1970-01-01') then 1 else 0 end as failures_cnt

from molinahealth_mdsdb.kb_knowledge_final src
left join molinahealth_mdwdb.d_kb_knowledge_c trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance) fnl ;