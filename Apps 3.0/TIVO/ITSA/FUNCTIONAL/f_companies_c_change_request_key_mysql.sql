SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt  from tivo_mdsdb.change_request_final b
left join tivo_mdwdb.d_change_request a
on a.row_id=b.sys_id and b.sourceinstance=a.source_id
CROSS JOIN
  (SELECT a.N + b.N * 10 + 1 AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
   ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(b.u_companies),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(b.u_companies),'UNSPECIFIED'), ',', '')))
left join  tivo_mdwdb.f_companies_c c
on  c.row_id=CONCAT(b.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(b.u_companies), ',', n.n), ',', -1),'UNSPECIFIED'))  and b.sourceinstance=c.source_id
WHERE COALESCE(a.row_key,CASE WHEN b.sys_id IS NULL THEN 0 else -1 end)<>c.change_request_key) temp;

