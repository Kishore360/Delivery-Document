SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(

SELECT A.SYS_ID,B.ROW_ID,A.asc_incident_last_resolved_by_c_key as  A_asc_incident_last_resolved_by_c_key,
  B_asc_incident_last_resolved_by_c_key FROM
(SELECT SYS_ID,sourceinstance, y.row_key AS   asc_incident_last_resolved_by_c_key
FROM mercuryins_mdsdb.u_asc_ticket_final x  left outer join 
(select source_id,row_key,row_id  from mercuryins_mdwdb.d_internal_contact
 )y on 
CONCAT('INTERNAL_CONTACT~',x.u_resolved_by)=y.row_id  AND sourceinstance= source_id 
)A
 JOIN  
(SELECT  asc_incident_last_resolved_by_c_key AS B_asc_incident_last_resolved_by_c_key,source_id,ROW_ID FROM  mercuryins_mdwdb.f_incident_asc_c
  )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)h
WHERE A_asc_incident_last_resolved_by_c_key<> B_asc_incident_last_resolved_by_c_key)E; 