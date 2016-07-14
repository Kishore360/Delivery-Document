

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_t_task_activity.task_key for #TABLE_TYPE' ELSE 'SUCCESS' END as Message
 
FROM <<tenant>>_mdsdb.sys_audit_final SRC 

JOIN <<tenant>>_mdwdb.#LKP_TABLE LKP 
 ON (SRC.documentkey = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id 
 AND SRC.tablename='#TABLE_TYPE')

LEFT JOIN <<tenant>>_mdwdb.f_t_task_activity TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id  AND  coalesce(TRGT.primary_sequence_id,-1) <>0
)
 

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

 AND COALESCE( COALESCE(LKP.row_key,CASE WHEN SRC.documentkey IS NULL THEN 0 ELSE -1 END) ,'')
 <> COALESCE(TRGT.task_key ,'')
