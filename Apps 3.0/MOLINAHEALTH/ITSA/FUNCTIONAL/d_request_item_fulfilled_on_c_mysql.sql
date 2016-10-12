select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else 'Success. All warehouse records are matching with source.' end Result
from 
(select 

case when COALESCE(CONVERT_TZ(COALESCE(lkp.fulfilled_on,src.closed_at),'UTC','America/Los_Angeles'),'1970-01-01 00:00:00') <> COALESCE(trgt.fulfilled_on_c,'1970-01-01 00:00:00') then src.sys_id else '' end as failures,

case when COALESCE(CONVERT_TZ(COALESCE(lkp.fulfilled_on,src.closed_at),'UTC','America/Los_Angeles'),'1970-01-01 00:00:00') <> COALESCE(trgt.fulfilled_on_c,'1970-01-01 00:00:00') then 1 else 0 end as failures_cnt

from molinahealth_mdsdb.sc_req_item_final src
left join molinahealth_mdwdb.d_request_item trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance 
left join 
(select ri.sys_id,ri.sourceinstance,max(su.sys_created_on) as fulfilled_on
from molinahealth_mdsdb.sc_req_item_final ri
join molinahealth_mdsdb.sys_audit_final su on ri.sys_id = su.documentkey 
join molinahealth_mdsdb.sys_choice_final sc on su.newvalue = sc.value
where su.tablename = 'sc_req_item' and su.fieldname = 'state' and sc.name = 'sc_req_item' and sc.element = 'state' and sc.label = 'Fulfilled'
group by ri.sys_id,ri.sourceinstance ) lkp on src.sys_id = lkp.sys_id and src.sourceinstance = lkp.sourceinstance ) fnl ;