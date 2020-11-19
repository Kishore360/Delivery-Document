SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from  fidelity_mdwdb.f_incident_caused_by_change_c a11
join  (SELECT CONCAT(inc.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_caused_by_change), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id,
   inc.sourceinstance AS source_id,
COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_caused_by_change), ',', n.n), ',', -1),'UNSPECIFIED') AS change_request_id
FROM fidelity_mdsdb.incident_final AS inc
JOIN
(SELECT a.N + b.N * 10 + 1 AS n
FROM
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(inc.u_caused_by_change),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(inc.u_caused_by_change),'UNSPECIFIED'), ',', '')))
where inc.cdctype<>'D')a12
on a11.row_id=a12.row_id and a11.source_id=a12.source_id
join fidelity_mdwdb.d_change_request a13
on a12.change_request_id=a13.row_id
where a13.row_key <>a11.change_request_key)a
