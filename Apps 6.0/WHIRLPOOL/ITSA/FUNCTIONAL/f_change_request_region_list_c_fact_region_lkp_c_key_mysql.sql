SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request_region_list_c_fact_region_lkp_c_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.change_request_final tsk
 JOIN
(SELECT a.N + b.N * 10 + 1 AS n
FROM
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(tsk.u_region_glist),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(tsk.u_region_glist),'UNSPECIFIED'), ',', '')))
JOIN whirlpool_mdwdb.f_change_request_region_list_c_fact TRGT 
 ON (CONCAT(tsk.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(tsk.u_region_glist), ',', n.n), ',', -1),'UNSPECIFIED')) =TRGT.row_id  
 AND tsk.sourceinstance= TRGT.source_id  )
LEFT JOIN whirlpool_mdwdb.d_region_lkp_c LKP 
 ON (COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(tsk.u_region_glist), ',', n.n), ',', -1),'UNSPECIFIED')= LKP.row_id 
AND tsk.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN tsk.u_region_glist IS NULL THEN 0 else -1 end)<> (TRGT.region_lkp_c_key)
 and tsk.cdctype='X'       