SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM wow_mdsdb.u_incident_outage_final inc
JOIN
  (SELECT a.N + b.N * 10 + 1 AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b	 
		ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(inc.u_resolution_source),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(inc.u_resolution_source),'UNSPECIFIED'), ',', '')))
 LEFT JOIN wow_mdwdb.f_incident_outage_resolution_source_c TRGT 
 ON (CONCAT(inc.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_tech), ',', n.n), ',', -1),'UNSPECIFIED')) =TRGT.row_id  
 AND inc.sourceinstance= TRGT.source_id  )
LEFT JOIN wow_mdwdb.d_incident LKP 
 ON ( inc.sys_id= LKP.row_id 
AND inc.sourceinstance= LKP.source_id )

 WHERE COALESCE(LKP.row_key,CASE WHEN inc.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.incident_key)
 
 
 