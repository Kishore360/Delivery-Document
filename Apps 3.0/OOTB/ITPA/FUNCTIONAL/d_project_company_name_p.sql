

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.company_name' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.pm_project_final SRC 
 LEFT JOIN <<tenant>>_mdsdb.fx_currency_instance_final FI
 ON (FI.id=SRC.sys_id and FI.field='work_cost') 
  LEFT JOIN <<tenant>>_mdsdb.fm_expense_line_final FEI 
 ON (FEI.task=SRC.sys_id ) 
 LEFT JOIN <<tenant>>_mdwdb.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE NULL<> COALESCE(TRGT.company_name ,'')
