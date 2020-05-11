select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_change_benefit_organization_fact' ELSE 'SUCCESS' END as Message from (
SELECT CONCAT(prb.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(prb.u_benefit_organization), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id,
   
   prb.sys_id AS change_benefit_organization_c_id,
  
	COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(prb.u_benefit_organization), ',', n.n), ',', -1),'UNSPECIFIED') AS u_change_benefit_organization_c_id
FROM fidelity_mdsdb.change_request_final AS prb
JOIN
(SELECT a.N + b.N * 10 + 1 AS n
FROM
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(prb.u_benefit_organization),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(prb.u_benefit_organization),'UNSPECIFIED'), ',', '')))) a
left join fidelity_mdwdb.f_change_benefit_organization_fact f on f.row_id=a.row_id
left join fidelity_mdwdb.d_change_request c on c.row_key=f.change_benefit_organization_c_key
left join fidelity_mdwdb.d_change_benefit_organization_c u on u.row_key = f.u_change_benefit_organization_c_key
where a.u_change_benefit_organization_c_id <> u.row_id and a.change_benefit_organization_c_id <> c.row_id

;

-- END

