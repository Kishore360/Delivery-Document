SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_raise_impact_c' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdwdb.d_problem a
JOIN
(
SELECT a.problem_key ,  group_concat( distinct c.incident_number SEPARATOR  ' , ') as number,
 group_concat( distinct c.source_url SEPARATOR  ' , ') as source_url
 from fidelity_mdwdb.f_problem a
 join fidelity_mdwdb.f_problem_related_incidents_c b 
on a.problem_key = b.problem_key
JOIN fidelity_mdwdb.d_incident c
ON  b.incident_key = c.row_key where  b.soft_deleted_flag='N'
group by 1
) b ON a.row_key = b.problem_key
where u_related_incidents_c<> b.number