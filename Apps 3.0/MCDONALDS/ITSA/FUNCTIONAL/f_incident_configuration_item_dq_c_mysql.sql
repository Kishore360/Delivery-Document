SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,configuration_item_dq_c,
(case when cmdb_ci  is  null  then 0 
 when cmdb_ci.sys_id  is  null  then 0 
 when cmdb_ci  is  not null  and cmdb_ci.sys_id is null then 0 
  else 1 end  
)  
from  mcdonalds_mdsdb.incident_final incident
left join mcdonalds_mdsdb.cmdb_ci_final cmdb_ci  
on incident.cmdb_ci =cmdb_ci.sys_id and incident.sourceinstance=cmdb_ci.sourceinstance
left join  mcdonalds_mdwdb.f_incident tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.configuration_item_dq_c<>(case when cmdb_ci  is  null  then 0 
 when cmdb_ci.sys_id  is  null  then 0 
 when cmdb_ci  is  not null  and cmdb_ci.sys_id is null then 0 
  else 1 end 
)  

 )a
 

 
 
 
