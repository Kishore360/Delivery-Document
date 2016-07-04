
SELECT CASE WHEN SRC_COUNT <> TRGT_COUNT THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN SRC_COUNT <> TRGT_COUNT THEN concat('RowCount did not Match. sys_audit_final : ',SRC_COUNT,' , f_t_task_activity : ',TRGT_COUNT)
ELSE 'SUCCESS' END as Message

FROM (select count(1) SRC_COUNT from <<tenant>>_mdsdb.sys_audit_final SRC 
WHERE  CONCAT(COALESCE(SRC.tablename,''),COALESCE(SRC.fieldname,''))  
IN ( SELECT CONCAT(COALESCE(t.source_table_name,''),COALESCE(TRIM(' ' FROM SUBSTRING_INDEX(SUBSTRING_INDEX(t.audit_columns, ',', n.n), ',', -1)),''))
 FROM app_test.lsm_ls_entity_audit_enable_table t CROSS JOIN
 (
  SELECT a.N + b.N 1 10 + 1 n
  FROM 
  (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
  ,(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
  ORDER BY n
 ) n
 WHERE n.n <= 1 + (LENGTH(t.audit_columns) - LENGTH(REPLACE(t.audit_columns, ',', '')))
)
) SRCF
,(SELECT COUNT(1) TRGT_COUNT FROM <<tenant>>_mdwdb.f_t_task_activity TRGT  WHERE  coalesce(TRGT.primary_sequence_id,-1) <>0) TRGTF
 
 
