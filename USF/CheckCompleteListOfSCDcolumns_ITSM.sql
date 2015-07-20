
SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result 
, CASE WHEN COUNT(1) > 0 THEN 'Columns in scdtype1_column_list and scdtype2_column_list is not complete for ITSM dimensions' 
ELSE 'SUCCESS' END AS Message 
FROM information_schema.columns
WHERE column_name NOT IN ('row_key','row_dn_key','domain_key','row_current_key','row_id','source_id','soft_deleted_flag','etl_run_number','soft_deleted_flag','current_flag','effective_from','effective_to','dw_inserted_on','dw_updated_on')
AND table_name IN ('dwh_d_configuration_item','dwh_d_domain','dwh_d_incident','dwh_d_problem','dwh_d_problem_task','dwh_d_request','dwh_d_request_item','dwh_d_request_task','dwh_d_survey','dwh_d_survey_instance','dwh_d_survey_question','dwh_d_task_sla')
AND table_schema = '<<tenant>>_mdwdb'
AND CONCAT(RIGHT(table_name, length(table_name)-4),'.',column_name) 
NOT IN (
SELECT CONCAT(target_table_name, '.', TRIM(' ' FROM SUBSTRING_INDEX(SUBSTRING_INDEX(t.scdtype1_column_list, ',', n.n), ',', -1)) )TableColumns
  FROM <<tenant>>_mdwdb.lsm_ls_scd_enable_table t CROSS JOIN 
(
   SELECT a.N + b.N 1 10 + 1 n
     FROM 
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
   ,(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ORDER BY n
) n
 WHERE n.n <= 1 + (LENGTH(t.scdtype1_column_list) - LENGTH(REPLACE(t.scdtype1_column_list, ',', '')))
UNION
SELECT CONCAT(target_table_name,'.', TRIM(' ' FROM SUBSTRING_INDEX(SUBSTRING_INDEX(t.scdtype2_column_list, ',', n.n), ',', -1) ))
  FROM <<tenant>>_mdwdb.lsm_ls_scd_enable_table t CROSS JOIN 
(
   SELECT a.N + b.N 1 10 + 1 n
     FROM 
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
   ,(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    ORDER BY n
) n
 WHERE n.n <= 1 + (LENGTH(t.scdtype2_column_list) - LENGTH(REPLACE(t.scdtype2_column_list, ',', ''))))



