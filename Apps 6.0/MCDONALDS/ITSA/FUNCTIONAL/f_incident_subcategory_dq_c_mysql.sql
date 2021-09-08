SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,assignment_group ,subcategory_dq_c,
(case when incident.u_subcategory  is  null  then 0 
when incident.u_subcategory  is not  null  and  u_subcategory.sys_id is null then 0 
when u_subcategory.u_subcategory in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or u_subcategory.u_subcategory is null 
	 or u_subcategory.u_subcategory='' or u_subcategory.u_subcategory=' ' then 0
   else 1 end 
)  
from  mcd_mdsdb.incident_final incident
left join mcd_mdsdb.u_subcategory_final u_subcategory    
on incident.u_subcategory =u_subcategory.sys_id
left join  mcd_mdwdb.f_incident tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.subcategory_dq_c<>(case when incident.u_subcategory  is  null  then 0 
when incident.u_subcategory  is not  null  and  u_subcategory.sys_id is null then 0 
when u_subcategory.u_subcategory in ('UNSPECIFED', 'unspecified', 'Unspecified', 'null', 'spaces', 'UNALLOCATED', 'Unallocated', 
     'unallocated', 'Undefined', 'UNDEFINED', 'undefined', 'UNKONWN', 'unknown', 'Unknown') or u_subcategory.u_subcategory is null 
	 or u_subcategory.u_subcategory='' or u_subcategory.u_subcategory=' ' then 0
   else 1 end 
)  

 )a
 
 