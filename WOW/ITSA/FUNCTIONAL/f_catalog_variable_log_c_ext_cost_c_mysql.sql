SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from (
SELECT u_ext_cost AS u_ext_cost,sourceinstance,concat(sys_id,'~1') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_ext_cost_02 AS u_ext_cost,sourceinstance,concat(sys_id,'~2') AS sourceinstance
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_ext_cost_03 AS u_ext_cost,sourceinstance,concat(sys_id,'~3') AS sourceinstance
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_ext_cost_04 AS u_ext_cost,sourceinstance,concat(sys_id,'~4') AS sourceinstance
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_ext_cost_05 AS u_ext_cost,sourceinstance,concat(sys_id,'~5') AS sourceinstance
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_ext_cost_06 AS u_ext_cost,sourceinstance,concat(sys_id,'~6') AS sourceinstance
   FROM wow_mdsdb.catalog_variable_log_final
   ORDER BY sys_id,sourceinstance) SRC
LEFT JOIN wow_mdwdb.f_catalog_variable_log_c TRGT ON TRGT.row_id = SRC.sys_id
AND TRGT.source_id = SRC.sourceinstance
WHERE TRGT.ext_cost_c <> SRC.u_ext_cost) temp