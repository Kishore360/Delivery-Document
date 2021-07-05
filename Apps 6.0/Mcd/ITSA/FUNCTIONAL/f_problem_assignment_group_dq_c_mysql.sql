SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,assignment_group ,assignment_group_dq_c,
case when incident.assignment_group  is  null  then 0 
when incident.assignment_group  is not  null  and  u_integration_srms_location.sys_id is null then 0 
when u_integration_srms_location.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or name is null 
	 or name='' or name=' ' then 0
   else 1 end 
 
 
from  mcd_mdsdb.problem_final incident
left join mcd_mdsdb.sys_user_group_final u_integration_srms_location 
on incident.assignment_group=u_integration_srms_location.sys_id and incident.sourceinstance= u_integration_srms_location.sourceinstance
left join  mcd_mdwdb.f_problem tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.assignment_group_dq_c<>(case when incident.assignment_group  is  null  then 0 
when incident.assignment_group  is not  null  and  u_integration_srms_location.sys_id is null then 0 
when u_integration_srms_location.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or name is null 
	 or name='' or name=' ' then 0
   else 1 end 
)  

 )a
 
 
 
 
 
 