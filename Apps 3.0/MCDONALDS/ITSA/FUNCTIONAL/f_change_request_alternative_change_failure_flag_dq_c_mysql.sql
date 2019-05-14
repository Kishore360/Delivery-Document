SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,u_closure_code ,alternative_change_failure_flag_dq_c,
case when incident.u_closure_code  is  null   then 0 
 when incident.u_closure_code   = 'router'    then 0 
when u_integration_srms_location.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or name is null 
	 or name='' or name=' ' then 0
   else 1 end 
)  
 
from  mcdonalds_mdsdb.change_request_final incident
left join  mcdonalds_mdwdb.f_change_request tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.alternative_change_failure_flag_dq_c<>(case when incident.u_closure_code  is  null  then 0 
when incident.u_closure_code   = 'router'    then 0 
when u_integration_srms_location.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or name is null 
	 or name='' or name=' ' then 0
   else 1 end 
)  

 )a
 
 
 
 
 
 