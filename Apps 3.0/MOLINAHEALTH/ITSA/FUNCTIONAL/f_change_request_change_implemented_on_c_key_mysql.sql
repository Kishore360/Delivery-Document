select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else 'Success. All warehouse records are matching with source.' end status
from 
(select 

case when COALESCE(DATE_FORMAT(CONVERT_TZ(lkp.change_implemented_on,'UTC','America/Los_Angeles'),'%Y%m%d'),'19700101') <> COALESCE(trgt.change_implemented_on_c_key,'19700101') then src.sys_id else '' end as failures,

case when COALESCE(DATE_FORMAT(CONVERT_TZ(lkp.change_implemented_on,'UTC','America/Los_Angeles'),'%Y%m%d'),'19700101') <> COALESCE(trgt.change_implemented_on_c_key,'19700101') then 1 else 0 end as failures_cnt

from molinahealth_mdsdb.change_request_final src
left join molinahealth_mdwdb.f_change_request trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance 
left join 
(select cr.sys_id,cr.sourceinstance,max(su.sys_created_on) as change_implemented_on
from molinahealth_mdsdb.change_request_final cr
join molinahealth_mdsdb.sys_audit_final su on cr.sys_id = su.documentkey 
join molinahealth_mdsdb.sys_choice_final sc on su.newvalue = sc.value
join molinahealth_mdsdb.sys_choice_final sc1 on cr.state = sc1.value
where su.tablename = 'change_request' and su.fieldname = 'state' and sc.name = 'change_request' and sc.element = 'state'
and (sc.label = 'Implemented Successfully' or sc.label = 'Implemented With Issues' or sc.label = 'Partially Implemented')
and (sc1.label = 'Implemented Successfully' or sc1.label = 'Implemented With Issues' or sc1.label = 'Partially Implemented')
group by cr.sys_id,cr.sourceinstance) lkp on src.sys_id = lkp.sys_id and src.sourceinstance = lkp.sourceinstance ) fnl ;