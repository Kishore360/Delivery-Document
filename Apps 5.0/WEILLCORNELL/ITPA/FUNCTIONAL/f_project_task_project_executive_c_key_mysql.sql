SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.project_scope_color_c_key' ELSE 'SUCCESS' END as Message
 FROM weillcornell_mdsdb.pm_project_final SRC
 LEFT JOIN weillcornell_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN weillcornell_mdwdb.d_internal_contact LKP 
 ON (concat('INTERNAL_CONTACT~',SRC.u_prj_exec)= LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_prj_exec IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_executive_c_key,'')
