select 
case 

when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else CONCAT('Success. All warehouse records are matching with source. Source Count : ',sum(src_not_null_count),' ; Target Count : ',sum(trgt_not_null_count)) end Result

from 
(select 
case when src.open_to_close_duration is not null then 1 else 0 end as src_not_null_count,

case when trgt.open_to_close_duration is not null then 1 else 0 end as trgt_not_null_count,

case when coalesce(case when lkp.dimension_wh_code = 'OPEN' then null else src.open_to_close_duration end,0)  <> COALESCE(trgt.open_to_close_duration,0) then src.sys_id else '' end as failures,

case when coalesce(case when lkp.dimension_wh_code = 'OPEN' then null else src.open_to_close_duration end,0) <> COALESCE(trgt.open_to_close_duration,0) then 1 else 0 end as failures_cnt

from 
(select 
ri.sys_id,ri.sourceinstance,timestampdiff(second,ri.opened_at,coalesce(sa_src.fulfilled_on,coalesce(ri.closed_at,ri.sys_updated_on))) as open_to_close_duration
from molinahealth_mdsdb.sc_req_item_final ri
left join (select su.documentkey,su.sourceinstance,max(su.sys_created_on) as fulfilled_on
from molinahealth_mdsdb.sys_audit_final su 
join molinahealth_mdsdb.sys_choice_final sc on su.newvalue = sc.value
where su.tablename = 'sc_req_item' and su.fieldname = 'state' and sc.name = 'sc_req_item' and sc.element = 'state' and sc.label = 'Fulfilled'
group by su.documentkey,su.sourceinstance) sa_src on ri.sys_id = sa_src.documentkey) src 
left join molinahealth_mdwdb.f_request_item trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance
left join molinahealth_mdwdb.d_lov_map lkp on trgt.state_src_key = lkp.src_key and lkp.dimension_class = 'STATE~SC_REQ_ITEM') fnl ;
