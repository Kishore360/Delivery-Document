SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,assignment_group ,caller_dq_c,
(case when caller_id  is  null  then 0 
 when sys_user.sys_id  is  null  then 0 
 when caller_id  is  not null  and sys_user.sys_id is null then 0 
 when sys_user.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or name is null 
	 or name='' or name=' ' then 0
  else 1 end 
)  
from  mcdonalds_mdsdb.incident_final incident
left join mcdonalds_mdsdb.sys_user_final sys_user    
on incident.caller_id =sys_user.sys_id and incident.sourceinstance=sys_user.sourceinstance
left join  mcdonalds_mdwdb.f_incident tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.caller_dq_c<>(case when caller_id  is  null  then 0 
 when sys_user.sys_id  is  null  then 0 
 when caller_id  is  not null  and sys_user.sys_id is null then 0 
 when sys_user.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or name is null 
	 or name='' or name=' ' then 0
  else 1 end 
)  

 )a
 
 
 
