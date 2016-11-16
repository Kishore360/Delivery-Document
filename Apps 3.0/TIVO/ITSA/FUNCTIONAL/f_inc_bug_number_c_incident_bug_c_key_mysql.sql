
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt  from tivo_mdsdb.incident_final inc
join tivo_mdsdb.u_m2m_bugzillas_tasks_final b
on inc.sys_id=b.u_task
left join tivo_mdsdb.u_bugzilla_final c
on b.u_bugzilla=c.sys_id
CROSS JOIN
  (SELECT a.N + b.N * 10 + c.N * 100 + 1 AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,	  
	 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
   ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(c.sys_id),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(c.sys_id),'UNSPECIFIED'), ',', '')))
left join tivo_mdwdb.d_incident_bug_c a
on a.row_id=COALESCE(CONCAT('BUG~INCIDENT~~~',SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(c.sys_id), ',', n.n), ',', -1)),'UNSPECIFIED') and b.sourceinstance=a.source_id
left join  tivo_mdwdb.f_inc_bug_number_c TRGT
on  TRGT.row_id=CONCAT(inc.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(b.sys_id), ',', n.n), ',', -1),'UNSPECIFIED'))  and b.sourceinstance=TRGT.source_id
WHERE COALESCE(a.row_key,CASE WHEN c.sys_id IS NULL THEN 0 else -1 end)<>TRGT.incident_bug_c_key ) temp;