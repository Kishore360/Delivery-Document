select 
case 
when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))
else CONCAT('Success. All warehouse records are matching with source. Source Count : ',sum(src_not_null_count),' ; Target Count : ',sum(trgt_not_null_count)) end Result
from 
(select 
case when src.u_client_aligned_application is not null then 1 else 0 end as src_not_null_count,
case when trgt.cat_application_c_flag is not null then 1 else 0 end as trgt_not_null_count,
case when COALESCE(IF(src.u_client_aligned_application=true,'Y','N'),'N') <> COALESCE(trgt.cat_application_c_flag,'N') then src.sys_id else '' end as failures,
case when COALESCE(IF(src.u_client_aligned_application=true,'Y','N'),'N') <> COALESCE(trgt.cat_application_c_flag,'N') then 1 else 0 end as failures_cnt
from cardinalhealth_mdsdb.cmdb_ci_application_final src
left join cardinalhealth_mdwdb.d_configuration_item trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance) fnl ;