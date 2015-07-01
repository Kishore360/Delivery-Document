SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
FROM uclahealth_mdsdb.incident_final 
 JOIN  
  uclahealth_mdwdb.d_incident B on sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
and u_category_name<>B.category_name_c
)E;