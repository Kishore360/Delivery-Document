select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

when sum(warnings_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. Few (sys_id || caller_id) - ',group_concat(distinct warnings))

when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) < 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. (sys_id || caller_id) : ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))

else 'Success. All warehouse records are matching with source.' end Result

from  
(select   
case when src.caller_id is not null and lkp.row_id is null then concat(src.sys_id,' || ',src.caller_id) else '' end as warnings,

case when src.caller_id is not null and lkp.row_id is null then 1 else 0 end as warnings_cnt,

case when COALESCE(lkp.row_key,CASE WHEN src.caller_id IS NULL THEN 0 else -1 end) <> (trgt.incident_caller_c_key)  then src.sys_id else '' end as failures,

case when COALESCE(lkp.row_key,CASE WHEN src.caller_id IS NULL THEN 0 else -1 end) <> (trgt.incident_caller_c_key) then 1 else 0 end as failures_cnt

from molinahealth_mdsdb.incident_final src 
left join molinahealth_mdwdb.f_incident trgt on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
left join molinahealth_mdwdb.d_internal_contact lkp on lkp.row_id = COALESCE(CONCAT('INTERNAL_CONTACT~',src.caller_id),'UNSPECIFIED') and lkp.source_id = src.sourceinstance)fnl;

