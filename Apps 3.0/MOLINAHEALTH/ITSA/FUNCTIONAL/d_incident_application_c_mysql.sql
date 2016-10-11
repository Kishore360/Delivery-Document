select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) >= 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. Few (sys_id || cmdb_ci) - ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))

when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) < 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. (sys_id || cmdb_ci) : ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))

else 'Success. All warehouse records are matching with source.' end Result

from 

(select   
case when src.cmdb_ci is not null and lkp.sys_id is null then concat(src.sys_id,' || ',src.cmdb_ci) else '' end as warnings,

case when src.cmdb_ci is not null and lkp.sys_id is null then 1 else 0 end as warnings_cnt,

case when COALESCE(lkp.name,'UNSPECIFIED') <> COALESCE(trgt.application_c,'UNSPECIFIED')  then src.sys_id else '' end as failures,

case when COALESCE(lkp.name,'UNSPECIFIED') <> COALESCE(trgt.application_c,'UNSPECIFIED') then 1 else 0 end as failures_cnt

FROM molinahealth_mdsdb.incident_final src 
LEFT JOIN molinahealth_mdwdb.d_incident trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdsdb.cmdb_ci_final lkp on src.cmdb_ci = lkp.sys_id and src.sourceinstance = lkp.sourceinstance ) fnl;
