SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select cmdb_ci ,configuration_item_dq_c,
case when incident.cmdb_ci  is  null  then 0 
when incident.cmdb_ci  is not  null  and  u_integration_srms_location.sys_id is null then 0 
when u_integration_srms_location.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or name is null 
	 or name='' or name=' ' then 0
   else 1 end 
  
 
from  mcd_mdsdb.problem_final incident
left join mcd_mdsdb.cmdb_ci_final  u_integration_srms_location 
on incident.cmdb_ci=u_integration_srms_location.sys_id and incident.sourceinstance= u_integration_srms_location.sourceinstance
left join  mcd_mdwdb.f_problem tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.configuration_item_dq_c<>(case when incident.cmdb_ci  is  null  then 0 
when incident.cmdb_ci  is not  null  and  u_integration_srms_location.sys_id is null then 0 
when u_integration_srms_location.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or name is null 
	 or name='' or name=' ' then 0
   else 1 end 
)  

 )a
 
 
 
 
 
 