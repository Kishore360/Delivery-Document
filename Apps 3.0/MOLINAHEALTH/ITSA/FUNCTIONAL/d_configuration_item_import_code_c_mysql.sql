select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else 'Success. All warehouse records are matching with source.' end Result
from 
(select 
case when COALESCE(src.u_import_code,'UNSPECIFIED') <> COALESCE(trgt.import_code_c,'UNSPECIFIED') then src.sys_id else '' end as failures,
case when COALESCE(src.u_import_code,'UNSPECIFIED') <> COALESCE(trgt.import_code_c,'UNSPECIFIED') then 1 else 0 end as failures_cnt
from molinahealth_mdsdb.cmdb_ci_final src
left join molinahealth_mdwdb.d_configuration_item trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance ) fnl ;