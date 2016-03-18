SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(

SELECT A.SYS_ID,B.ROW_ID,A.last_resolved_by_key as  A_last_resolved_by_key,B.last_resolved_by_key as  B_last_resolved_by_key FROM
(SELECT SYS_ID,sourceinstance, y.row_key AS   last_resolved_by_key
FROM mercuryinsurance_mdsdb.u_asc_ticket_final x  left outer join 
(select source_id,row_key,row_id  from mercuryinsurance_mdwdb.d_internal_contact
 )y on 
CONCAT('INTERNAL_CONTACT~',x.u_resolved_by)=y.row_id  AND sourceinstance= source_id 
)A
 JOIN  
(SELECT  last_resolved_by_key AS last_resolved_by_key,source_id,ROW_ID FROM  mercuryinsurance_mdwdb.f_incident_asc_c
  )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)h
WHERE A_last_resolved_by_key<> B_last_resolved_by_key)E; 