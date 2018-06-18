SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from (
SELECT u_sale_proceed AS u_sale_proceed,sourceinstance,concat(sys_id,'~1') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_sale_proceed_02 AS u_sale_proceed,sourceinstance,concat(sys_id,'~2') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_sale_proceed_03 AS u_sale_proceed,sourceinstance,concat(sys_id,'~3') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_sale_proceed_04 AS u_sale_proceed,sourceinstance,concat(sys_id,'~4') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_sale_proceed_05 AS u_sale_proceed,sourceinstance,concat(sys_id,'~5') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_sale_proceed_06 AS u_sale_proceed,sourceinstance,concat(sys_id,'~6') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   ORDER BY sys_id,sourceinstance) SRC
LEFT JOIN wow_mdwdb.f_catalog_variable_log_c TRGT ON TRGT.row_id = SRC.sys_id
AND TRGT.source_id = SRC.sourceinstance
WHERE TRGT.sale_proceed_c <> SRC.u_sale_proceed
) temp