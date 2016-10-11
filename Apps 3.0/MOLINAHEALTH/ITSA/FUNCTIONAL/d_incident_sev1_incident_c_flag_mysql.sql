select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else 'Success. All warehouse records are matching with source.' end status
from 
(select 
case when 
(case when (lkp.sys_id is not null and lkp.u_power_outage <> 1 and src.u_outage_class <> 'weather') then 'Y' else 'N' end) <> COALESCE(trgt.sev1_incident_flag_c,'N') then src.sys_id else '' end as failures,
case when (case when (lkp.sys_id is not null and lkp.u_power_outage <> 1 and src.u_outage_class <> 'weather') then 'Y' else 'N' end) <> COALESCE(trgt.sev1_incident_flag_c,'N') then 1 else 0 end as failures_cnt
from molinahealth_mdsdb.incident_final src
left join molinahealth_mdwdb.d_incident trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance
left join molinahealth_mdsdb.u_major_incident_final lkp on src.sys_id = lkp.sys_id and src.sourceinstance = lkp.sourceinstance ) fnl ;