SELECT CASE WHEN count(1)> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_incident.last_resolved_on' ELSE 'data matched' END as
 Message  from 
paloalto_mdsdb.u_walk_up_final a
left join  paloalto_mdsdb.sys_user_final b on u_requestor=b.sys_id
join paloalto_mdwdb.d_walk_up_c c on a.sys_id=c.row_id and a.sourceinstance=c.source_id
where case when timestampdiff(day,b.u_start_date,a.opened_at )<=30 then 'Y' else 'N' end <>new_employee_ticket_c_flag


