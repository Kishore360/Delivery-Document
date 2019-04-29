SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select number,assignment_group ,close_code_dq_c,
(
case when opened_by is null then 0
     when sys_user.department is null then 0
	 when opened_by is not null and sys_user.sys_id  is null then 0
	 when sys_user.department is not null  and cmn_department.sys_id  is null then 0
   else 1 end 
)  
from  mcdonalds_mdsdb.incident_final incident
left join mcdonalds_mdsdb.sys_user_final sys_user    
on incident.opened_by =sys_user.sys_id and incident.sourceinstance=sys_user.sourceinstance
left join mcdonalds_mdsdb.cmn_department_final cmn_department
on sys_user.department=cmn_department.sys_id and incident.sourceinstance=cmn_department.sourceinstance
 join  mcdonalds_mdwdb.f_incident tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where  tgt.department_dq_c<>(
case when opened_by is null then 0
     when sys_user.department is null then 0
	 when opened_by is not null and sys_user.sys_id  is null then 0
	 when sys_user.department is not null  and cmn_department.sys_id  is null then 0
   else 1 end 
)  

 )a
 
 
 