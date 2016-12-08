SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
nbcu_mdwdb.d_request trgt
join nbcu_mdsdb.sc_request_final sc_request_delta 
on trgt.row_id = sc_request_delta.sys_id and trgt.source_id = sc_request_delta.sourceinstance
left join (select ri.sys_id,ri.sourceinstance,max(su.sys_created_on) as fulfilled_on
from nbcu_mdwdb.d_request trg1 join
nbcu_mdsdb.sc_request_final ri 
on trg1.row_id=ri.sys_id and trg1.source_id=ri.sourceinstance
join nbcu_mdsdb.sys_audit_final su on ri.sys_id = su.documentkey 
join nbcu_mdsdb.sys_choice_final sc on su.newvalue = sc.value
where su.tablename = 'sc_request' and su.fieldname = 'request_state' and sc.name = 'sc_request' and sc.element = 'request_state' 
and sc.label = 'fulfilled'
group by ri.sys_id,ri.sourceinstance) src
on sc_request_delta.sys_id = src.sys_id and sc_request_delta.sourceinstance = src.sourceinstance
where 
CONVERT_TZ(coalesce(src.fulfilled_on,sc_request_delta.closed_at),'GMT','America/New_York')<>trgt.fulfilled_on_c