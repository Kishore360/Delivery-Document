select 
case 

when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('FAILURE. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('FAILURE. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else CONCAT('Success. All warehouse records are matching with source. Source Count : ',sum(src_not_null_count),' , Target Count : ',sum(trgt_not_null_count)) end Result
from 
(select 

case when COALESCE(IF(src.active = 1, 'Y', 'N'),'Z') <> COALESCE(trgt.active_flag,'Z') then src.sys_id else '' end as failures,

case when COALESCE(IF(src.active = 1, 'Y', 'N'),'Z') <> COALESCE(trgt.active_flag,'Z') then 1 else 0 end as failures_cnt,

case when src.active is not null then 1 else 0 end as src_not_null_count,

case when trgt.active_flag is not null then 1 else 0 end as trgt_not_null_count

from molinahealth_mdsdb.kb_knowledge_final src
left join molinahealth_mdwdb.d_kb_knowledge_c trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance) fnl ;