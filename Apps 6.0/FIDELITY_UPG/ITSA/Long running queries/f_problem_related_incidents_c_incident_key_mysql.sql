SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from  fidelity_mdwdb.f_problem_related_incidents_c a11
join  ( SELECT
COALESCE(incident_id,'UNSPECIFIED') as incident_id ,
COALESCE(problem.sys_id,'UNSPECIFIED') problem_id ,
CONCAT(COALESCE(problem.sys_id,'UNSPECIFIED'),'~',COALESCE(incident_id ,'UNSPECIFIED')) AS row_id,
CASE  WHEN problem.cdctype='D' then 'Y' else 'N'  END AS soft_deleted_flag,
problem.sourceinstance AS source_id  
		
FROM fidelity_mdsdb.problem_final problem
LEFT JOIN (select   substring_index(
substring_index(u_related_incidents, ',', n),',',-1 ) as incident_id , sys_id, sourceinstance
from fidelity_mdsdb.problem_final
join (SELECT a.N + b.N * 10 +1 AS n
FROM
(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a, (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b 
ORDER BY n)a
on char_length(u_related_incidents) - char_length(replace(u_related_incidents, ',', '')) >= n - 1) tmp_stg_number_c 
on problem.sys_id = tmp_stg_number_c.sys_id and tmp_stg_number_c.sourceinstance=problem.sourceinstance)a12
on a11.row_id=a12.row_id and a11.source_id=a12.source_id
join fidelity_mdwdb.d_incident a13
on a12.incident_id=a13.row_id
where a13.row_key <>a11.incident_key)a
