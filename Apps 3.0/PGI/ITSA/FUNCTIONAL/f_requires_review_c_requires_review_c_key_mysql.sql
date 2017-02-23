SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt
from pgi_mdsdb.u_external_incident_final a
CROSS JOIN
  (SELECT a.N + b.N * 10 + c.N * 100 + 1 AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,	  
	 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
   ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(a.u_requires_review),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(a.u_requires_review),'UNSPECIFIED'), ',', ''))) 
left join pgi_mdwdb.d_lov c on 
CONCAT('NAME~WHAT_REQUIRES_REVIEW~~~',SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(a.u_requires_review), ',', n.n), ',', -1))=c.row_id
and 

a.sourceinstance=c.source_id
inner join pgi_mdwdb.f_requires_review_c b  

on a.sys_id=b.row_id and 

a.sourceinstance=b.source_id

where requires_review_c_key<>coalesce(c.row_key,case when u_requires_review is null then 0 else -1 end) ) c


