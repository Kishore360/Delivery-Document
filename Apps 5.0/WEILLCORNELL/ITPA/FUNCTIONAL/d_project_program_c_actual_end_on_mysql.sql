SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.project_scope_color_c_key' ELSE 'SUCCESS' END as Message
 FROM weillcornell_mdsdb.u_project_program_final SRC
 LEFT JOIN weillcornell_mdwdb.d_project_program_c TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( convert_tz(SRC.work_end,'GMT','America/New_York'),'%Y%m%d')  <> TRGT.actual_end_on
