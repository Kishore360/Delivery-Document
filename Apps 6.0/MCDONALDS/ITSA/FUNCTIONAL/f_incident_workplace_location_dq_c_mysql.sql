SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,assignment_group ,workplace_location_dq_c,
(case when incident.u_workplace_location  is  null  then 0 
when incident.u_workplace_location  is not  null  and  u_integration_srms_location.sys_id is null then 0 
when u_integration_srms_location.u_name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or u_name is null 
	 or u_name='' or u_name=' ' then 0
   else 1 end 
)  
from  mcd_mdsdb.incident_final incident
left join mcd_mdsdb.u_integration_srms_location_final u_integration_srms_location 
on incident.u_workplace_location=u_integration_srms_location.sys_id and incident.sourceinstance= u_integration_srms_location.sourceinstance
left join  mcd_mdwdb.f_incident tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.workplace_location_dq_c<>(case when incident.u_workplace_location  is  null  then 0 
when incident.u_workplace_location  is not  null  and  u_integration_srms_location.sys_id is null then 0 
when u_integration_srms_location.u_name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or u_name is null 
	 or u_name='' or u_name=' ' then 0
   else 1 end 
)  

 )a
 
 
 
 
 
 