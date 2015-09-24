SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.floor_area_c A_floor_area_c ,B.floor_area_c B_floor_area_c FROM
(SELECT SYS_ID,sourceinstance,u_floor_area AS floor_area_c
FROM uclahealth_mdsdb.incident_final )A
 JOIN  
(SELECT floor_area_c,source_id,ROW_ID FROM  uclahealth_mdwdb.d_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_floor_area_c<>B_floor_area_c)E;