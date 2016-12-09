select 
case 

when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else CONCAT('Success. All warehouse records are matching with source. Source Count : ',sum(src_not_null_count),' ; Target Count : ',sum(trgt_not_null_count)) end Result

from 
(select 
case when src.overdue_duration is not null then 1 else 0 end as src_not_null_count,

case when trgt.overdue_duration is not null then 1 else 0 end as trgt_not_null_count,

case when COALESCE(src.overdue_duration,0) = COALESCE(trgt.overdue_duration,0) then src.sys_id else '' end as failures,

case when COALESCE(src.overdue_duration,0) = COALESCE(trgt.overdue_duration,0) then 1 else 0 end as failures_cnt
from 
(select 
ri.sys_id,ri.sourceinstance,
case 
when sc.dimension_wh_code = 'OPEN' then case when odf.lastupdated > convert_tz(ri.due_date,'UTC','America/Los_Angeles') then 
TIMESTAMPDIFF(SECOND,convert_tz(ri.due_date,'UTC','America/Los_Angeles'),odf.lastupdated) else 0 end

when sc.dimension_wh_code  in ('FULFILLED', 'CLOSED') then case when convert_tz(COALESCE(sa_src.fulfilled_on,ri.closed_at),'UTC','America/Los_Angeles') > convert_tz(ri.due_date,'UTC','America/Los_Angeles') then 
TIMESTAMPDIFF(SECOND,convert_tz(ri.due_date,'UTC','America/Los_Angeles'),convert_tz(COALESCE(sa_src.fulfilled_on,ri.closed_at),'UTC','America/Los_Angeles')) else 0 end

else 0 end as overdue_duration

from molinahealth_mdsdb.sc_req_item_final ri
join molinahealth_mdsdb.us_sc_req_item_map_final sc on ri.state = sc.dimension_code and sc.dimension_class = 'STATE~SC_REQ_ITEM'
left join (select su.documentkey,su.sourceinstance,max(su.sys_created_on) as fulfilled_on
from molinahealth_mdsdb.sys_audit_final su 
join molinahealth_mdsdb.sys_choice_final sc on su.newvalue = sc.value
where su.tablename = 'sc_req_item' and su.fieldname = 'state' and sc.name = 'sc_req_item' and sc.element = 'state' and sc.label = 'Fulfilled'
group by su.documentkey,su.sourceinstance) sa_src on ri.sys_id = sa_src.documentkey
left join (select source_id,max(lastupdated) lastupdated from molinahealth_mdwdb.d_o_data_freshness group by source_id) odf on ri.sourceinstance = odf.source_id ) src 
left join molinahealth_mdwdb.f_request_item trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance) fnl ;