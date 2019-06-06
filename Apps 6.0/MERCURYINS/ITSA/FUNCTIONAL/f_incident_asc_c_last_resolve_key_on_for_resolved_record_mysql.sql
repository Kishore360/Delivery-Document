
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select COUNT(*) cnt from(
SELECT A.SYS_ID,B.ROW_ID,
B.  asc_incident_last_resolved_on_c_key B_asc_incident_last_resolved_on_c_key ,
case when year <2000 then A.asc_incident_last_resolved_on_c_key+20000000 else A.asc_incident_last_resolved_on_c_key 
end as  A_asc_incident_last_resolved_on_c_key from
(SELECT SYS_ID,sourceinstance, 
DATE_FORMAT(CONVERT_TZ(coalesce(u_resolved,sys_updated_on),'GMT','America/Los_Angeles'),'%Y')  AS   year,
DATE_FORMAT(CONVERT_TZ(coalesce(u_resolved,sys_updated_on),'GMT','America/Los_Angeles'),'%Y%m%d')  AS   asc_incident_last_resolved_on_c_key
FROM mercury_mdsdb.u_asc_ticket_final 

)A
 JOIN  
(SELECT  f.asc_incident_last_resolved_on_c_key,f.source_id,f.ROW_ID FROM  mercury_mdwdb.f_incident_asc_c f
join mercury_mdwdb.d_lov_map dlm ON f.asc_incident_state_c_key = dlm.src_key and f.asc_incident_state_src_code_c=dlm.dimension_code 
where dlm.dimension_class = 'STATE~INCIDENT'
AND dlm.dimension_wh_code IN('RESOLVED','CLOSED') and asc_incident_state_src_code_c>4
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)h
WHERE A_asc_incident_last_resolved_on_c_key<> B_asc_incident_last_resolved_on_c_key)E;
