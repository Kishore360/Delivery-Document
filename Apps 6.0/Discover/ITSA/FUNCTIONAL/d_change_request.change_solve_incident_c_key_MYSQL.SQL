SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.change_solve_incident_c_key' ELSE 'SUCCESS' END as Message FROM 
discover_mdwdb.d_change_request di
LEFT join (SELECT emer.change_id,emer.sourceinstance,emer.sys_created_on, max(emer.incident_id) as incident_id FROM (select inc.sys_id incident_id, trt.sourceinstance,chr.sys_id change_id, chr.sys_created_on from discover_mds_viewdb.incident_final inc
join discover_mds_viewdb.task_rel_task_final trt on trt.parent=inc.sys_id
join discover_mds_viewdb.task_rel_type_final trty on trt.type=trty.sys_id and trty.sys_name ='Solved by::Solves'
join discover_mds_viewdb.change_request_final chr on trt.child=chr.sys_id
where inc.category not in ('Call Alter - Planned','Call Alter - Emergency') and 
cast((timestampdiff(second,inc.opened_at,COALESCE(chr.start_date,chr.sys_created_on))/86400) AS DECIMAL(19,4)) >= 30 and
chr.type ='emergency'
union all
select inc.sys_id incident_id,trt.sourceinstance,chr.sys_id change_id , chr.sys_created_on  from discover_mds_viewdb.incident_final inc
join discover_mds_viewdb.task_rel_task_final trt on trt.parent=inc.sys_id
join discover_mds_viewdb.task_rel_type_final trty on trt.type=trty.sys_id and trty.sys_name ='Solved by::Solves'
join discover_mds_viewdb.change_request_final chr on trt.child=chr.sys_id
where inc.category not in ('Call Alter - Planned','Call Alter - Emergency') and 
cast((timestampdiff(second,chr.opened_at,COALESCE(chr.start_date,chr.work_start))/3600) AS DECIMAL(19,4))<72  and 
 chr.type ='normal') emer
JOIN(
select change_id, sourceinstance, max(sys_created_on) as sys_created_on from (select inc.sys_id incident_id, trt.sourceinstance,chr.sys_id change_id, chr.sys_created_on from discover_mds_viewdb.incident_final inc
join discover_mds_viewdb.task_rel_task_final trt on trt.parent=inc.sys_id
join discover_mds_viewdb.task_rel_type_final trty on trt.type=trty.sys_id and trty.sys_name ='Solved by::Solves'
join discover_mds_viewdb.change_request_final chr on trt.child=chr.sys_id
where inc.category not in ('Call Alter - Planned','Call Alter - Emergency') and 
cast((timestampdiff(second,inc.opened_at,COALESCE(chr.start_date,chr.sys_created_on))/86400) AS DECIMAL(19,4)) >= 30 and
chr.type ='emergency'
union all
select inc.sys_id incident_id,trt.sourceinstance,chr.sys_id change_id , chr.sys_created_on  from discover_mds_viewdb.incident_final inc
join discover_mds_viewdb.task_rel_task_final trt on trt.parent=inc.sys_id
join discover_mds_viewdb.task_rel_type_final trty on trt.type=trty.sys_id and trty.sys_name ='Solved by::Solves'
join discover_mds_viewdb.change_request_final chr on trt.child=chr.sys_id
where inc.category not in ('Call Alter - Planned','Call Alter - Emergency') and 
cast((timestampdiff(second,chr.opened_at,COALESCE(chr.start_date,chr.work_start))/3600) AS DECIMAL(19,4))<72  and 
 chr.type ='normal')Z
group by 1,2
)X
on emer.change_id=X.change_id and emer.sourceinstance=X.sourceinstance and emer.sys_created_on=X.sys_created_on
group by 1,2,3) src 
on src.change_id=di.row_id and src.sourceinstance=di.source_id
LEFT join  discover_workdb.d_incident dc 
on src.incident_id=dc.row_id and src.sourceinstance=dc.source_id
where di.row_key not in (0,-1) and (di.change_solve_incident_c_key<>CASE WHEN src.incident_id is null then 0 else COALESCE(dc.row_key,-1) end 
or di.change_solve_incident_c_key is null);