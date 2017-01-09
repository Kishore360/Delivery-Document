select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else 'Success. All warehouse records are matching with source.' end Result
from 
(select 

case when COALESCE(case when lv_mp.dimension_wh_code = 'OPEN' then null else CONVERT_TZ(COALESCE(lkp.fulfilled_on,coalesce(src.closed_at,src.sys_updated_on)),'UTC','America/Los_Angeles') end ,'1970-01-01 00:00:00') <> COALESCE(trgt.fulfilled_on_c,'1970-01-01 00:00:00') then src.sys_id else '' end as failures,

case when COALESCE(case when lv_mp.dimension_wh_code = 'OPEN' then null else CONVERT_TZ(COALESCE(lkp.fulfilled_on,coalesce(src.closed_at,src.sys_updated_on)),'UTC','America/Los_Angeles') end ,'1970-01-01 00:00:00') <> COALESCE(trgt.fulfilled_on_c,'1970-01-01 00:00:00')  then 1 else 0 end as failures_cnt

from molinahealth_mdsdb.sc_req_item_final src
inner join molinahealth_mdwdb.d_request_item trgt on trgt.source_id = src.sourceinstance and trgt.row_id = src.sys_id  
inner join molinahealth_mdwdb.f_request_item f_trgt on trgt.row_key = f_trgt.request_item_key
inner join molinahealth_mdwdb.d_lov_map lv_mp on f_trgt.state_src_key =  lv_mp.src_key and lv_mp.dimension_class = 'STATE~SC_REQ_ITEM'
left join 
(select su.documentkey,su.sourceinstance,max(su.sys_created_on) as fulfilled_on
from molinahealth_mdsdb.sys_audit_final su where su.tablename = 'sc_req_item' and su.fieldname = 'state' and su.newvalue = 12
group by su.documentkey,su.sourceinstance ) lkp on src.sys_id = lkp.documentkey and src.sourceinstance = lkp.sourceinstance ) fnl ;
