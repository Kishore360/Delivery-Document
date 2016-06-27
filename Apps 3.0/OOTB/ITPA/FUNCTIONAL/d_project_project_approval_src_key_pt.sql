SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_approval_src_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.pm_project_task_final SRC 
 LEFT JOIN <<tenant>>_mdsdb.fx_currency_instance_final FI
 ON (FI.id=SRC.sys_id and FI.field='work_cost') 
  LEFT JOIN <<tenant>>_mdsdb.fm_expense_line_final FEI 
 ON (FEI.task=SRC.sys_id ) 
 LEFT JOIN <<tenant>>_mdwdb.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( concat('PROJECT~','APPROVAL~','~',approval) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_approval_src_key ,'');

