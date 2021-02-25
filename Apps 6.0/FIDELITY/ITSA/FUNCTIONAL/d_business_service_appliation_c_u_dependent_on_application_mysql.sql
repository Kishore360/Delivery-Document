select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_business_service_application_c.u_dependent_on_application' ELSE 'SUCCESS' END as Message  
 from (
SELECT distinct 
CONCAT(concat('BUSINESS_SERVICE~',APP.sys_id),'~',concat('APPLICATION~',
(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(APP.u_dependent_on_application), ',', n.n), ',', -1)))) AS row_id,
   APP.sys_id AS sys_id,
    COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(APP.u_dependent_on_application), ',', n.n), ',', -1),'') AS task_application_c_id
FROM fidelity_mdsdb.cmdb_ci_service_final AS APP
JOIN
(SELECT a.N + b.N * 10 + 1 AS n
FROM
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(APP.u_dependent_on_application),'')) - 
LENGTH(REPLACE(COALESCE(TRIM(APP.u_dependent_on_application),''), ',', '')))) a
 left join fidelity_mdwdb.d_business_service_application_c f on f.row_id=a.row_id
 left join fidelity_mdwdb.d_application c on c.row_key=f.task_application_c_key
 where a.task_application_c_id = c.row_id