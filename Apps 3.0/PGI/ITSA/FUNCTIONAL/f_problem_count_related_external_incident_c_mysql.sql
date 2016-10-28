SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message
 FROM pgi_mdwdb.f_problem f 
 JOIN (SELECT f.problem_key,count(f.incident_key) as count_related_external_incident_c FROM pgi_mdwdb.f_incident f join pgi_mdwdb.d_incident d ON d.row_key=f.incident_key WHERE d.external_flag = 'Y' GROUP BY 1) d ON f.problem_key = d.problem_key
WHERE COALESCE(d.count_related_external_incident_c,0) <> f.count_related_external_incident_c

