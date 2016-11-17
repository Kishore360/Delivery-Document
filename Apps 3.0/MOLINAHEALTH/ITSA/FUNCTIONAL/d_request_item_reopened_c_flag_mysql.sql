select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else 'Success. All warehouse records are matching with source.' end Result
from 

(select 
case when src.src_reopen_flag <> trgt.reopened_c_flag then src.sys_id else '' end as failures,

case when src.src_reopen_flag <> trgt.reopened_c_flag  then 1 else 0 end as failures_cnt
from 
(select req.sys_id,req.sourceinstance,IF(reopen_cnt >0 , 'Y','N') as src_reopen_flag
from molinahealth_mdsdb.sc_req_item_final req
left join (select su.documentkey,su.sourceinstance,sum((case when lv_mp_old.dimension_wh_code in  ('FULFILLED','CLOSED') and lv_mp_new.dimension_wh_code in ('OPEN') then 1 else 0 end)) as reopen_cnt
from molinahealth_mdsdb.sys_audit_final su 
join molinahealth_mdwdb.d_lov_map lv_mp_old on lv_mp_old.dimension_class = 'STATE~SC_REQ_ITEM' and su.oldvalue = lv_mp_old.dimension_code 
join molinahealth_mdwdb.d_lov_map lv_mp_new on lv_mp_new.dimension_class = 'STATE~SC_REQ_ITEM' and su.newvalue = lv_mp_new.dimension_code 
where su.tablename = 'sc_req_item' and su.fieldname = 'state'
group by su.documentkey,su.sourceinstance) sa on req.sys_id = sa.documentkey and req.sourceinstance = sa.sourceinstance ) src  
join molinahealth_mdwdb.d_request_item trgt on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id)fnl;








