


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from (
select COUNT(1) cnt from(
SELECT A.SYS_ID,B.ROW_ID,
B.last_resolved_on_key B_last_resolved_on_key ,
case when year <2000 then A.last_resolved_on_key+20000000 else A.last_resolved_on_key 
end as  A_last_resolved_on_key from
(SELECT SYS_ID,sourceinstance, 
DATE_FORMAT(CONVERT_TZ(coalesce(u_actual_resolve_date,closed_at,sys_updated_on),'GMT' ,'America/Los_Angeles'),'%Y')  AS   year,
DATE_FORMAT(CONVERT_TZ(coalesce(u_actual_resolve_date,closed_at,sys_updated_on),'GMT' ,'America/Los_Angeles'),'%Y%m%d')  AS   last_resolved_on_key
FROM   intuit_mdsdb.u_incident_task_final s
 

)A
 JOIN  
(SELECT  f.last_resolved_on_key,f.source_id,f.ROW_ID FROM  intuit_mdwdb.f_incident_task_c f
join intuit_mdwdb.d_lov_map dlm ON f.state_src_key = dlm.src_key and f.state_src_code=dlm.dimension_code 
where dlm.dimension_class = 'STATE~U_INCIDENT_TASK'
AND dlm.dimension_wh_code IN('RESOLVED','CLOSED')
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=A.SYS_ID)h
WHERE A_last_resolved_on_key<>B_last_resolved_on_key)E;
