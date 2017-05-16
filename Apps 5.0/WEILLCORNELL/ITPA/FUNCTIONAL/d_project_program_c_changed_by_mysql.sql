SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_program_c.planned_end_on' ELSE 'SUCCESS' END as Message
 FROM weillcornell_mdsdb.u_project_program_final SRC
 LEFT JOIN weillcornell_mdwdb.d_project_program_c TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE SRC.sys_updated_by  <> TRGT.changed_by;
