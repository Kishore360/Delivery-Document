SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,s1.manager ,Assigned_To_Manager_dq_c,
case when s1.manager  is  null  then 0 
when s1.manager  is not  null  and  s1.sys_id is null then 0 
when s2.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or s2.name is null 
	 or s2.name='' or s2.name=' ' then 0
   else 1 end 
 
 
from  mcd_mdsdb.problem_final incident
left join mcd_mdsdb.sys_user_final s1 
on incident.assigned_to=s1.sys_id and incident.sourceinstance= s1.sourceinstance
left join mcd_mdsdb.sys_user_final s2 
on s1.manager=s2.sys_id and s2.sourceinstance= s1.sourceinstance
left join  mcd_mdwdb.f_problem tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.Assigned_To_Manager_dq_c<>(case when s1.manager  is  null  then 0 
when s1.manager  is not  null  and  s1.sys_id is null then 0 
when s2.name in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or s2.name is null 
	 or s2.name='' or s2.name=' ' then 0
   else 1 end 
)  

 )a
 
 
 
 
 
 
 
 
 