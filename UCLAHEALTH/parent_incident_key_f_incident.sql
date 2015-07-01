SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  parent_incident_key A_parent_incident_key,B.  parent_incident_key B_parent_incident_key FROM
(SELECT SYS_ID,sourceinstance,  y.row_key AS   parent_incident_key
FROM uclahealth_mdsdb.incident_final x join uclahealth_mdwdb.d_incident y on
x.u_parent_ticket=y.row_id)A
 JOIN  
(SELECT  parent_incident_key,source_id,ROW_ID FROM  uclahealth_mdwdb.f_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_parent_incident_key<> B_parent_incident_key)E;