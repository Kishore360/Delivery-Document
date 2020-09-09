SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_raise_impact_c' ELSE 'SUCCESS' END as Message
from
fidelity_mdwdb.d_application a
LEFT JOIN (
select group_concat(b.u_value SEPARATOR  ', ') as platform ,CONCAT('Application~',a.app_id) as app_id,a.sourceinstance  from (SELECT cast(COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(app.u_platform), ',', n.n), ',', -1),'UNSPECIFIED')as char(32)) AS platform,app.sys_id as app_id,app.sourceinstance from fidelity_mdsdb.cmdb_ci_appl_final app
JOIN
(SELECT a.N + b.N * 10 + 1 AS n
FROM
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(app.u_platform),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(app.u_platform),'UNSPECIFIED'), ',', '')))) a  
join fidelity_mdsdb.u_fmr_tech_stack_attributes_final b
ON a.platform collate utf8_unicode_ci = b.sys_id
group by 2 
) b ON a.row_id = b.app_id and a.source_id = b.sourceinstance
where  
a.platform_c  <> COALESCE(b.platform,'UNSPECIFIED') 