SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
Count(1) as cnt
from  rogersdev_mdwdb.f_problem_pit_c a11
join 
(SELECT CONCAT(inc.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_pit), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id,
       inc.sourceinstance AS source_id,
       COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_pit), ',', n.n), ',', -1),'UNSPECIFIED') AS pit_id
FROM rogersdev_mdsdb.problem_final inc
CROSS JOIN
  (SELECT a.N + b.N * 10 + 1 AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
      (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
   ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(inc.u_pit),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(inc.u_pit),'UNSPECIFIED'), ',', '')))
) a12
on a11.row_id=a12.row_id and a11.source_id=a12.source_id
join rogersdev_mdwdb.d_internal_contact a13
on concat('INTERNAL_CONTACT~',pit_id)=a13.row_id
where coalesce(a13.row_key,case when pit_id ='UNSPECIFIED' then 0 else -1 end  ) <>a11.assigned_to_key)a
