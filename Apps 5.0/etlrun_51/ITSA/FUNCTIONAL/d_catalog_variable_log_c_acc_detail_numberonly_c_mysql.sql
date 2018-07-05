SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM
(SELECT count(1) as cnt
 from 
(SELECT u_acc_detail_numberonly  AS acc_detail_numberonly_c,sourceinstance,concat(sys_id,'~1') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_acc_detail_numberonly_02 AS acc_detail_numberonly_c,sourceinstance,concat(sys_id,'~2') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_acc_detail_numberonly_03 AS acc_detail_numberonly_c,sourceinstance,concat(sys_id,'~3') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_acc_detail_numberonly_04 AS acc_detail_numberonly_c,sourceinstance,concat(sys_id,'~4') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_acc_detail_numberonly_05 AS acc_detail_numberonly_c,sourceinstance,concat(sys_id,'~5') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   UNION ALL 
   SELECT u_acc_detail_numberonly_06 AS acc_detail_numberonly_c,sourceinstance,concat(sys_id,'~6') AS sys_id
   FROM wow_mdsdb.catalog_variable_log_final
   ORDER BY sys_id,sourceinstance) SRC
LEFT JOIN wow_mdwdb.d_catalog_variable_log_c TRGT 
ON TRGT.row_id = SRC.sys_id AND TRGT.source_id = SRC.sourceinstance
WHERE TRGT.acc_detail_numberonly_c <> SRC.acc_detail_numberonly_c ) temp