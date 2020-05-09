
select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_track_business_units_affected_c' ELSE 'SUCCESS' END as Message  
 from (

SELECT distinct CONCAT(prb.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(prb.u_external_customers_affected), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id,
   
   prb.sys_id AS change_track_business_units_id,
  
	COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(prb.u_external_customers_affected), ',', n.n), ',', -1),'UNSPECIFIED') AS track_business_units_affected_c_id
FROM fidelity_mdsdb.change_request_final AS prb
JOIN
(SELECT a.N + b.N * 10 + 1 AS n
FROM
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(prb.u_external_customers_affected),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(prb.u_external_customers_affected),'UNSPECIFIED'), ',', '')))) a
left join fidelity_mdwdb.f_track_business_units_affected_c f on f.row_id=a.row_id
left join fidelity_mdwdb.d_change_request c on c.row_key=f.change_track_business_units_key
left join fidelity_mdwdb.d_fmr_business_unit_c u on u.row_key = f.track_business_units_affected_c_key
where a.track_business_units_affected_c_id <> u.row_id and a.change_track_business_units_id <> c.row_id
;

-- END

