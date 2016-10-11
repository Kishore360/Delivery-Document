select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else 'Success. All warehouse records are matching with source.' end status

from 

(select   
case when COALESCE(src.u_health_plan_entity_affected,'UNSPECIFIED') <> COALESCE(trgt.health_plan_entity_affected_c,'UNSPECIFIED')  then src.sys_id else '' end as failures,

case when COALESCE(src.u_health_plan_entity_affected,'UNSPECIFIED') <> COALESCE(trgt.health_plan_entity_affected_c,'UNSPECIFIED') then 1 else 0 end as failures_cnt

FROM molinahealth_mdsdb.problem_final src 
LEFT JOIN molinahealth_mdwdb.d_problem trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id ) fnl;
