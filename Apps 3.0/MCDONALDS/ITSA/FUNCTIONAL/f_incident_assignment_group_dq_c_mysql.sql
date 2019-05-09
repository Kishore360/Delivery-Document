SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM
(
select number, incident.assignment_group,sys_user_group.sys_id ,assignment_group_dq_c,
(case when assignment_group  is not null and sys_user_group.sys_id is null then 0 
when assignment_group  is  null and sys_user_group.sys_id is null then 0 
else 1
end) 
from  mcdonalds_mdsdb.incident_final incident
left join mcdonalds_mdsdb.sys_user_group_final sys_user_group    
on incident.assignment_group =sys_user_group.sys_id and incident.sourceinstance=sys_user_group.sourceinstance
join     mcdonalds_mdwdb.f_incident tgt
on incident.sys_id=tgt.row_id and incident.sourceinstance=tgt.source_id
where tgt.assignment_group_dq_c<>(case when assignment_group  is not null and sys_user_group.sys_id is null then 0 
when assignment_group  is  null and sys_user_group.sys_id is null then 0 
else 1
end)  )a;


