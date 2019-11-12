SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_task.ci_class_autofill_src_c_key' ELSE 'SUCCESS' END as Message from(
  SELECT count(1) as cnt 
  from
  wpl_mdwdb.d_task dst
JOIN wpl_mdsdb.task_final td 
ON dst.row_id = td.sys_id AND dst.source_id= td.sourceinstance
JOIN wpl_mdwdb.d_lov LKP
ON (COALESCE(CONCAT('CI_CLASS_AUTOFILL_C~TASK~',UPPER(td.u_ci_autofill)),'UNSPECIFIED'))= LKP.row_id 
 AND td.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN td.u_ci_autofill is null THEN 0 else -1 end) = (dst.ci_class_autofill_src_c_key)
  and td.CDCTYPE<>'D'
)a;