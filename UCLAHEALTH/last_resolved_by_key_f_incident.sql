SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.last_resolved_by_key as  A_last_resolved_by_key,B.last_resolved_by_key as  B_last_resolved_by_key FROM
(SELECT SYS_ID,sourceinstance, y.row_key AS   last_resolved_by_key
FROM uclahealth_mdsdb.incident_final x join 
(select row_key,row_id  from uclahealth_mdwdb.d_internal_contact
 )y on 
u_resolved_by=REPLACE(row_id,'INTERNAL_CONTACT~','' )
)A
 JOIN  
(SELECT  last_resolved_by_key AS last_resolved_by_key,source_id,ROW_ID FROM  uclahealth_mdwdb.f_incident
  )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_last_resolved_by_key<> B_last_resolved_by_key)E; 
