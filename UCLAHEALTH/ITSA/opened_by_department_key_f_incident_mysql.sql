SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
FROM uclahealth_mdsdb.incident_final x left join uclahealth_mdwdb.d_incident y
on  x.u_department=row_id
 left JOIN  
 uclahealth_mdwdb.f_incident B on
 y.source_id=B.source_id AND B.row_id=y.row_id
WHERE y.row_key<> B.opened_by_department_key)E;