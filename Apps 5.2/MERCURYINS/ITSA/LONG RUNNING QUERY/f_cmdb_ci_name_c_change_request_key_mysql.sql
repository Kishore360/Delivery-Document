create index change_fin_index on mercuryins_mdsdb.change_request_final (sys_id,sourceinstance); -- ,u_ci_name: 0.59 sec
create index cmdb_ci_fact_db_index on mercuryins_mdwdb.f_cmdb_ci_name_c (row_id,source_id);  -- ,change_request_key : 0.18 sec
create index cmdb_ci_dimension_db_index on mercuryins_mdwdb.d_change_request (row_id,source_id);  -- row_key : 0.57


SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM (SELECT CONCAT(cr.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(cr.u_ci_name), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id,
       cr.sourceinstance AS source_id,
       cr.sys_id AS change_request_id
FROM mercuryins_mdsdb.change_request_final cr
CROSS JOIN
  (SELECT a.N + b.N * 10 + c.N * 100 + 1 AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,	  
	 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
   ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(cr.u_ci_name),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(cr.u_ci_name),'UNSPECIFIED'), ',', '')))) SRC 
JOIN mercuryins_mdwdb.f_cmdb_ci_name_c TRGT 
ON SRC.Row_id=TRGT.row_id and SRC.source_id=TRGT.source_id
join mercuryins_mdwdb.d_change_request LKP
on SRC.change_request_id=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.change_request_id is null then  0 else -1 end )<>TRGT.change_request_key
;

Drop index change_fin_index on mercuryins_mdsdb.change_request_final;
Drop index cmdb_ci_fact_db_index on mercuryins_mdwdb.f_cmdb_ci_name_c;
Drop index cmdb_ci_dimension_db_index on mercuryins_mdwdb.d_change_request;
