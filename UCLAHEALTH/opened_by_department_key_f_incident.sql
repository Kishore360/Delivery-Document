SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  opened_by_department_key A_opened_by_department_key,B.  opened_by_department_key B_opened_by_department_key FROM
(SELECT SYS_ID,sourceinstance, 
y.row_key AS   opened_by_department_key
FROM uclahealth_mdsdb.incident_final x join uclahealth_mdwdb.d_incident y
where x.u_department=row_id
)A
 JOIN  
(SELECT    
opened_by_department_key,source_id,ROW_ID FROM  uclahealth_mdwdb.f_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_opened_by_department_key<> B_opened_by_department_key)E;