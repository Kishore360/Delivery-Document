
SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN COUNT(1) >0 THEN 'Soft_deleted_flag did not match for f_t_task_activity' 
ELSE 'SUCCESS' END as Message
FROM (select SRC.cdctype,SRC.sys_id,SRC.sourceinstance from <<tenant>>_mdsdb.sys_audit_bwd_delta SRC 
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
AND SRC.jobid =(select max(jobid) from <<tenant>>_mdsdb.sys_audit_bwd_delta
WHERE sys_id = SRC.sys_id)
) SRCF
LEFT JOIN <<tenant>>_mdwdb.f_t_task_activity TRGT 
ON (SRCF.sys_id  =TRGT.row_id  
AND SRCF.sourceinstance = TRGT.source_id  
)
WHERE CASE WHEN SRCF.cdctype='A' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')
