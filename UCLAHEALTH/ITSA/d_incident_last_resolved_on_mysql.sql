SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,case when year <2000 then A.last_resolved_on+20000000000000 
else A.last_resolved_on
end as  A_last_resolved_on
,B. last_resolved_on  B_last_resolved_on FROM
(SELECT SYS_ID,sourceinstance,
DATE_FORMAT(CONVERT_TZ(u_resolved_date,'GMT','America/Los_Angeles'),'%Y')  AS   year,
 DATE_FORMAT(CONVERT_TZ(u_resolved_date,'GMT','America/Los_Angeles'),'%Y%m%d%h%m%s')  
 AS last_resolved_on
FROM uclahealth_mdsdb.incident_final )A
JOIN  
(SELECT DATE_FORMAT(last_resolved_on,'%Y%m%d%h%m%s') last_resolved_on ,source_id,ROW_ID FROM
uclahealth_mdwdb.d_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_last_resolved_on<>B_last_resolved_on  )E

