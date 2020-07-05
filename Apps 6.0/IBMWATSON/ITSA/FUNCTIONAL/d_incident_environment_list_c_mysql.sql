 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_problem_region_list_c.pivot_date' ELSE 'SUCCESS' END as Message from ( select count(1) cnt  
 from ibmwatson_mdsdb.incident_final  a
 JOIN
(SELECT a.N + b.N * 10 + 1 AS n
FROM
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(a.u_environment),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(a.u_environment),'UNSPECIFIED'), ',', '')))
 left join ibmwatson_mdwdb.d_environment_c d  
   ON (COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(a.u_environment), ',', n.n), ',', -1),'UNSPECIFIED')= d.row_id 
AND a.sourceinstance= d.source_id )
 left join ibmwatson_mdwdb.d_incident b
 on  CONCAT(a.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(a.u_environment), ',', n.n), ',', -1),'UNSPECIFIED')) =b.row_id  
 where environment_list_c<>u_environment )a
 
 
