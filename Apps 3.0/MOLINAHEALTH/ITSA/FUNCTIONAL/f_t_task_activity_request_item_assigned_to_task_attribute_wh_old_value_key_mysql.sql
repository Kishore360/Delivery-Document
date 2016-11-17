select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

when sum(warnings_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. Few (sys_id || oldvalue) - ',group_concat(distinct warnings))

when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) < 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. (sys_id || oldvalue) : ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))

else 'Success. All warehouse records are matching with source.' end Result

from  
(select   
case when src.oldvalue is not null and lkp.row_id is null then concat(src.sys_id,' || ',src.oldvalue) else '' end as warnings,

case when src.oldvalue is not null and lkp.row_id is null then 1 else 0 end as warnings_cnt,

case when COALESCE(lkp.row_key,CASE WHEN src.oldvalue IS NULL THEN 0 else -1 end) <> (trgt.task_attribute_wh_old_value_key)  then src.sys_id else '' end as failures,

case when COALESCE(lkp.row_key,CASE WHEN src.oldvalue IS NULL THEN 0 else -1 end) <> (trgt.task_attribute_wh_old_value_key) then 1 else 0 end as failures_cnt
from 
(select sys_id,sourceinstance,documentkey,oldvalue,CONCAT('INTERNAL_CONTACT~',oldvalue) as lkp_row_id
from molinahealth_mdsdb.sys_audit_final 
where tablename = 'sc_req_item' and fieldname = 'assigned_to') src
left join 
(select row_id,source_id,task_key,task_attribute_wh_old_value,task_attribute_wh_old_value_key
from molinahealth_mdwdb.f_t_task_activity where task_wh_type = 'sc_req_item' and task_attribute_wh_name = 'assigned_to') trgt on src.sys_id = trgt.row_id 
left join molinahealth_mdwdb.d_internal_contact lkp on lkp.source_id = src.sourceinstance and lkp.row_id = src.lkp_row_id ) fnl;