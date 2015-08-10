SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from (select count(1) as cnt 
FROM uclahealth_mdsdb.incident_final A
 JOIN  
  uclahealth_workdb.ds_incident B on sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE u_room<>B.room_c)E;