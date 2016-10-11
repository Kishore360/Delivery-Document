select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else 'Success. All warehouse records are matching with source.' end status
from 
(select 
case when COALESCE(CASE WHEN (src.sys_created_on is null or src.work_end is null) THEN NULL WHEN TIMESTAMPDIFF(SECOND,src.sys_created_on,src.work_end) < 0 THEN NULL ELSE TIMESTAMPDIFF(SECOND,src.sys_created_on,src.work_end) end,0) <> COALESCE(trgt.time_to_fulfill_c,0) then src.sys_id else '' end as failures,
case when COALESCE(CASE WHEN (src.sys_created_on is null or src.work_end is null) THEN NULL WHEN TIMESTAMPDIFF(SECOND,src.sys_created_on,src.work_end) < 0 THEN NULL ELSE TIMESTAMPDIFF(SECOND,src.sys_created_on,src.work_end) end,0) <> COALESCE(trgt.time_to_fulfill_c,0) then 1 else 0 end as failures_cnt
from molinahealth_mdsdb.sc_req_item_final src
left join molinahealth_mdwdb.f_request_item trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance ) fnl ;