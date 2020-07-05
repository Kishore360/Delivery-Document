 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_group_coordinated_with_c.pivot_date' ELSE 'SUCCESS' END as Message
  FROM truist_mdsdb.change_request_final a
JOIN
  (SELECT a.N + b.N * 10 + 1 AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b  
                              ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(u_group_coordinated_with),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(u_group_coordinated_with),'UNSPECIFIED'), ',', '')))
join truist_mdwdb.f_group_coordinated_with_c b
on CONCAT(sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(u_group_coordinated_with), ',', n.n), ',', -1),'UNSPECIFIED'))=b.row_id and a.sourceinstance=b.source_id
where CONVERT_TZ(sys_updated_on,'GMT','America/Los_Angeles') <> b.pivot_date
and a.cdctype='X';