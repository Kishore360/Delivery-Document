SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select cnt(1),resolved_at,closed_at,sys_updated_on,A_last_resolved_on_key,B_last_resolved_on_key from(
SELECT A.SYS_ID,B.ROW_ID,
resolved_at,closed_at,sys_updated_on,
B.  last_resolved_on_key B_last_resolved_on_key ,
case when year <2000 then A.last_resolved_on_key+20000000 else A.last_resolved_on_key 
end as  A_last_resolved_on_key from
(SELECT SYS_ID,sourceinstance,
u_resolved_at as resolved_at,
closed_at as closed_at,
sys_updated_on as sys_updated_on, 
DATE_FORMAT(CONVERT_TZ(coalesce(u_resolved_at,closed_at,sys_updated_on),"GMT","America/New_York"),'%Y')  AS   year,
DATE_FORMAT(CONVERT_TZ(coalesce(u_resolved_at,closed_at,sys_updated_on),"GMT","America/New_York"),'%Y%m%d')  AS   last_resolved_on_key
FROM cardinalhealth_mdsdb.incident_final 

)A
 JOIN  
(SELECT  f.last_resolved_on_key,f.source_id,f.ROW_ID FROM  cardinalhealth_mdwdb.f_incident f
join cardinalhealth_mdwdb.d_lov_map dlm ON f.state_src_key = dlm.src_key and f.state_src_code=dlm.dimension_code 
where dlm.dimension_class = 'STATE~INCIDENT'
AND dlm.dimension_wh_code IN('RESOLVED','CLOSED')and state_src_code>4
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)h
WHERE A_last_resolved_on_key<> B_last_resolved_on_key)E;