select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else 'Success. All warehouse records are matching with source.' end Result
from 
(select 
case when (case when lkp.findings_publish_duration > 5 then 'Y' else 'N' end) <> COALESCE(trgt.findings_publish_c_flag,'N') then src.sys_id else '' end as failures,
case when (case when lkp.findings_publish_duration > 5 then 'Y' else 'N' end) <> COALESCE(trgt.findings_publish_c_flag,'N') then 1 else 0 end as failures_cnt
from molinahealth_mdsdb.problem_final src
left join molinahealth_mdwdb.d_problem trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance 
left join 
(select sys_id,sourceinstance,sum(timestampdiff(day,convert_tz(state_created_on,'UTC','America/Los_Angeles'),convert_tz(status_code_created_on,'UTC','America/Los_Angeles'))) as findings_publish_duration
from 
(select
pf.sys_id,pf.sourceinstance,pf.number,pf.state,pf.u_status_code,
su_state.documentkey,su_state.sys_created_on as state_created_on,su_state.sequence_id as state_sequence_id,
su_status_code.sys_created_on as status_code_created_on,su_status_code.sequence_id as status_code_sequence_id
from molinahealth_mdsdb.problem_final pf
left join 
(select sa.*,
IF(@prev = documentkey collate utf8_general_ci,@rownum:=@rownum+1,@rownum:=1) as sequence_id,
@prev:=documentkey as prev_value
from 
(select documentkey,oldvalue,newvalue,su.sys_created_on
from molinahealth_mdsdb.sys_audit_final su
join molinahealth_mdsdb.sys_choice_final sc on su.newvalue = sc.value
where su.tablename = 'problem' and su.fieldname = 'state' and sc.name ='problem' and sc.element = 'state' and sc.label = 'RCA' order by documentkey,sys_created_on) sa
join (select @prev:='NA',@rownum:=0)t ) su_state on pf.sys_id = su_state.documentkey
left join 
(select sa.*,
IF(@prev = documentkey collate utf8_general_ci,@rownum:=@rownum+1,@rownum:=1) as sequence_id,
@prev:=documentkey as prev_value
from 
(select documentkey,oldvalue,newvalue,sucode.sys_created_on
from molinahealth_mdsdb.sys_audit_final sucode
join molinahealth_mdsdb.sys_choice_final sc_status on sucode.newvalue = sc_status.value 
where sucode.tablename = 'problem' and sucode.fieldname = 'u_status_code' and  sc_status.name ='problem' and sc_status.element = 'u_status_code' and sc_status.label = 'Initial Findings Pending Review' order by documentkey,sys_created_on) sa
join (select @prev:='NA',@rownum:=0) t)su_status_code on su_state.documentkey = su_status_code.documentkey and su_state.sequence_id = su_status_code.sequence_id 
where su_status_code.sequence_id is not null) tmp 
group by sys_id,sourceinstance) lkp on src.sys_id = lkp.sys_id and src.sourceinstance = lkp.sourceinstance ) fnl ;