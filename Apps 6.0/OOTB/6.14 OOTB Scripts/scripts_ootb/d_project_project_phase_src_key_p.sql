

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_phase_src_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D') FI
 ON (FI.id=SRC.sys_id and FI.field='work_cost') 
  LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') FEI 
 ON (FEI.task=SRC.sys_id ) 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( concat('PROJECT~','PHASE~',SRC.phase) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.phase IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_phase_src_key ,'')
