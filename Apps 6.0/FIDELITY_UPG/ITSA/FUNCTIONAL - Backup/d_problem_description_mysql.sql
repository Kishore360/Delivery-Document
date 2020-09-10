SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_raise_impact_c' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdsdb.problem_final SRC
JOIN fidelity_mdwdb.d_problem trgt1
on SRC.sys_id = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
WHERE SRC.description <>trgt1.description
