SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.caused_by_change_flag' ELSE 'SUCCESS' END as Message 
from discover_mdwdb.d_incident d_inc
left join (SELECT emer.sys_id, emer.sourceinstance, emer.change_created_on, max(emer.change_id) as change_id FROM (select a.u_enterprise_incident as sys_id ,a.sourceinstance, d.sys_id as change_id, d.sys_created_on as change_created_on  from discover_mdsdb.problem_final a
join  discover_mdsdb.task_rel_task_final b
on a.sys_id=b.parent and a.sourceinstance=b.sourceinstance and a.u_problem_caused_by_change ='Yes'
join discover_mdsdb.task_rel_type_final c
on b.type=c.sys_id and b.sourceinstance=c.sourceinstance and c.sys_name='Caused By::Causes'
join discover_mdsdb.change_request_final d
on d.sys_id=b.child and d.sourceinstance=b.sourceinstance
where a.u_enterprise_incident is not null
UNION ALL
select inc.sys_id, inc.sourceinstance, d.sys_id as change_id, d.sys_created_on as change_created_on from discover_mdsdb.incident_final inc
join  discover_mdsdb.task_rel_task_final b
on inc.sys_id=b.parent and inc.sourceinstance=b.sourceinstance
join discover_mdsdb.task_rel_type_final c
on b.type=c.sys_id and b.sourceinstance=c.sourceinstance and c.sys_name='Caused By::Causes'
join discover_mdsdb.change_request_final d
on d.sys_id=b.child and b.sourceinstance=d.sourceinstance 
where inc.category not in ('call_alter_emergency','call_alter_planned')) emer
JOIN(
select P.sys_id, P.sourceinstance, max(P.change_created_on) as change_created_on from (select a.u_enterprise_incident as sys_id ,a.sourceinstance, d.sys_id as change_id, d.sys_created_on as change_created_on  from discover_mdsdb.problem_final a
join  discover_mdsdb.task_rel_task_final b
on a.sys_id=b.parent and a.sourceinstance=b.sourceinstance and a.u_problem_caused_by_change ='Yes'
join discover_mdsdb.task_rel_type_final c
on b.type=c.sys_id and b.sourceinstance=c.sourceinstance and c.sys_name='Caused By::Causes'
join discover_mdsdb.change_request_final d
on d.sys_id=b.child and d.sourceinstance=b.sourceinstance
where a.u_enterprise_incident is not null
UNION ALL
select inc.sys_id, inc.sourceinstance, d.sys_id as change_id, d.sys_created_on as change_created_on from discover_mdsdb.incident_final inc
join  discover_mdsdb.task_rel_task_final b
on inc.sys_id=b.parent and inc.sourceinstance=b.sourceinstance
join discover_mdsdb.task_rel_type_final c
on b.type=c.sys_id and b.sourceinstance=c.sourceinstance and c.sys_name='Caused By::Causes'
join discover_mdsdb.change_request_final d
on d.sys_id=b.child and b.sourceinstance=d.sourceinstance 
where inc.category not in ('call_alter_emergency','call_alter_planned'))P
group by 1,2
)X
on emer.sys_id=X.sys_id and emer.sourceinstance=X.sourceinstance and emer.change_created_on=X.change_created_on
group by 1,2,3) X
on d_inc.row_id=X.sys_id and X.sourceinstance=d_inc.source_id
LEFT join discover_workdb.d_change_request d_chg
ON X.change_id=d_chg.row_id and X.sourceinstance=d_chg.source_id
where d_inc.caused_by_change_flag<>CASE WHEN X.sys_id is not null then 'Y' else 'N' end
and d_inc.row_key not in (0,-1) ;