SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.fulfilled_on_c_key' ELSE 'SUCCESS' END as Message from
(select src.sys_id,f_trgt.row_id,src.src_fulfilled_on_c_key ,f_trgt.fulfilled_on_c_key as trgt_fulfilled_on_c_key
from 
(select ri_final.sys_id,ri_final.sourceinstance,COALESCE(DATE_FORMAT(CONVERT_TZ(coalesce(tmp.fulfilled_on,ri_final.closed_at),'UTC','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED') as src_fulfilled_on_c_key
from molinahealth_mdsdb.sc_req_item_final ri_final
inner join 
(select ri.sys_id,ri.sourceinstance,max(su.sys_created_on) as fulfilled_on
from molinahealth_mdsdb.sc_req_item_final ri
join molinahealth_mdsdb.sys_audit_final su on ri.sys_id = su.documentkey 
join molinahealth_mdsdb.sys_choice_final sc on su.newvalue = sc.value
where su.tablename = 'sc_req_item' and su.fieldname = 'state' and sc.name = 'sc_req_item' and sc.element = 'state' 
and sc.label = 'Fulfilled'
group by ri.sys_id,ri.sourceinstance) tmp on ri_final.sys_id = tmp.sys_id and ri_final.sourceinstance = tmp.sourceinstance ) src
left join molinahealth_mdwdb.f_request_item f_trgt on f_trgt.row_id = src.sys_id and f_trgt.source_id = src.sourceinstance ) fnl
where src_fulfilled_on_c_key <> trgt_fulfilled_on_c_key;
