SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message
 FROM pgi_mdwdb.f_problem f 
 JOIN ( SELECT problem_key,sum(child_incidents_count_c) as child_incident_count
FROM pgi_mdwdb.f_incident GROUP BY 1 ) d ON f.problem_key = d.problem_key
WHERE COALESCE(d.child_incident_count,0) <> f.count_incident_children_c 

