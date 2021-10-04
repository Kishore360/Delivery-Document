SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,
(case when u_affected_environment  is  null  then 0 
when u_affected_environment in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or u_affected_environment is null 
	 or u_affected_environment='' or u_affected_environment=' ' then 0 
   else 1 end 
)  
from  mcd_mdsdb.change_request_final incident
left join  mcd_mdwdb.f_change_request tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.affected_environment_dq_c<>(case when u_affected_environment  is  null  then 0
when u_affected_environment in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or u_affected_environment is null 
	 or u_affected_environment='' or u_affected_environment=' ' then 0  
   else 1 end 
)  

 )a
 
 
 