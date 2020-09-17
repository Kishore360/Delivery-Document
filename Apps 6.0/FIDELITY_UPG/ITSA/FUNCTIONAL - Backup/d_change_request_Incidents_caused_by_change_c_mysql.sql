 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.change_caused_incident_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT  
FROM  
fidelity_mdwdb.d_change_request a			
left JOIN (SELECT			
            COUNT(incident_id) AS incident_count,			
            change_request_id AS change_request_key			
			FROM (SELECT CONCAT(inc.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_caused_by_change), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id,
   inc.sourceinstance AS source_id,			
   inc.sys_id AS incident_id,			
   COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_caused_by_change), ',', n.n), ',', -1),'UNSPECIFIED') AS change_request_id			
FROM fidelity_mdsdb.incident_final AS inc			
JOIN			
(SELECT a.N + b.N * 10 + 1 AS n			
FROM			
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,			
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b			
ORDER BY n) n			
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(inc.u_caused_by_change),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(inc.u_caused_by_change),'UNSPECIFIED'), ',', ''))))   a			
        GROUP BY 2) b			
ON a.row_id= b.change_request_key 
where incident_count<> a.incidents_caused_by_change_c
)
 temp;




