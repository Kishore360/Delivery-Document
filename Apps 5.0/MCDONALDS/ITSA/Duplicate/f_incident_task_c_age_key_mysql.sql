SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from mcdonalds_mdsdb.u_incident_task_final s
left join mcdonalds_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN mcdonalds_mdwdb.d_lov L  
ON ((t.age BETWEEN L.lower_range_value AND L.upper_range_value)	AND L.dimension_class = 'AGEBUCKET_WH~INCIDENT' )
WHERE COALESCE(L.row_key, case when t.age is null or t.age = 0 THEN 0 else -1 end ) 
 <> t.age_key) temp