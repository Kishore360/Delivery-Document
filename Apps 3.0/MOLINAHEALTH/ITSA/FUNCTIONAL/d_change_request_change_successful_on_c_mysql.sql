SELECT 
-- fnl.* 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.change_successful_on_c' ELSE 'SUCCESS' END as Message 
from
(select src.sys_id,trgt.row_id,src.change_successful_on as src_change_successful_on,trgt.change_successful_on_c as trgt_change_successful_on_c
from 
(select cr_final.sys_id,cr_final.sourceinstance,CONVERT_TZ(tmp.change_successful_on,'UTC','America/Los_Angeles') as change_successful_on
from molinahealth_mdsdb.change_request_final cr_final
inner join 
(select cr.sys_id,cr.sourceinstance,max(su.sys_created_on) as change_successful_on
from molinahealth_mdsdb.change_request_final cr
join molinahealth_mdsdb.sys_audit_final su on cr.sys_id = su.documentkey 
join molinahealth_mdsdb.sys_choice_final sc on su.newvalue = sc.value
join molinahealth_mdsdb.sys_choice_final sc1 on cr.state = sc1.value
where su.tablename = 'change_request' and su.fieldname = 'state' 
and sc.name = 'change_request' and sc.element = 'state' and sc.label = 'Implemented Successfully'
and sc1.name = 'change_request' and sc1.element = 'state' and sc1.label = 'Implemented Successfully'
group by cr.sys_id,cr.sourceinstance) tmp on cr_final.sys_id = tmp.sys_id and cr_final.sourceinstance = tmp.sourceinstance ) src
left join molinahealth_mdwdb.d_change_request trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance ) fnl
where COALESCE(src_change_successful_on,'1970-01-01 00:00:00') <> COALESCE(fnl.trgt_change_successful_on_c,'1970-01-01 00:00:00');
