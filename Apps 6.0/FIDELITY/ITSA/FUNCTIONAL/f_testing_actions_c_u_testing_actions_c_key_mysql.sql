SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message 
FROM  
(
select count(*) as  cnt
from (
SELECT distinct CONCAT(prb.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(prb.u_testing_actions), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id,
   
   prb.sys_id AS change_task_testing_c_id,
   
	COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(prb.u_testing_actions), ',', n.n), ',', -1),'UNSPECIFIED') AS u_testing_actions_c_id
FROM fidelity_mdsdb.change_task_final AS prb
JOIN
(SELECT a.N + b.N * 10 + 1 AS n
FROM
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(prb.u_testing_actions),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(prb.u_testing_actions),'UNSPECIFIED'), ',', '')))
where prb.cdctype<>'D') a 
 join fidelity_mdwdb.f_testing_actions_c  f 
on f.row_id=a.row_id
join fidelity_mdwdb.d_testing_actions_c t 
on a.u_testing_actions_c_id=t.row_id
where  t.row_key<>f.u_testing_actions_c_key)a

;


