SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  opened_by_department_key A_opened_by_department_key,B.  opened_by_department_key B_opened_by_department_key FROM
(SELECT SYS_ID,sourceinstance, u_department AS   opened_by_department_key
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT  case when u_department =1 then 'Y' else 'N' end AS   opened_by_department_key,source_id,ROW_ID FROM  uclahealth_mdwdb.f_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_opened_by_department_key<> B_opened_by_department_key)E;