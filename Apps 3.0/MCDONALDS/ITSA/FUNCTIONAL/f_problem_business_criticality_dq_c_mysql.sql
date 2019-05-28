SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select u_business_service  ,business_criticality_dq_c,
case when incident.u_business_service   is  null  then 0 
when incident.u_business_service   is not  null  and  u_integration_srms_location.sys_id is null then 0 
when u_integration_srms_location.busines_criticality in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or busines_criticality is null 
	 or busines_criticality='' or busines_criticality=' ' then 0
   else 1 end 

 
from  mcdonalds_mdsdb.problem_final incident
left join mcdonalds_mdsdb.cmdb_ci_service_final  u_integration_srms_location 
on incident.u_business_service =u_integration_srms_location.sys_id and incident.sourceinstance= u_integration_srms_location.sourceinstance
left join  mcdonalds_mdwdb.f_problem tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.business_criticality_dq_c<>(case when incident.u_business_service   is  null  then 0 
when incident.u_business_service   is not  null  and  u_integration_srms_location.sys_id is null then 0 
when u_integration_srms_location.busines_criticality in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or busines_criticality is null 
	 or busines_criticality='' or busines_criticality=' ' then 0
   else 1 end 
)  

 )a
 
 
 
 
 
 
 
 