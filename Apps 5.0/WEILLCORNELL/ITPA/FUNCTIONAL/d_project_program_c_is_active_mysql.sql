SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_problem.met_sla_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM weillcornell_mdsdb.u_project_program_final SRC 
  JOIN weillcornell_mdwdb.d_project_program_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN active = 1 then 'Y' else 'N' END)<> (TRGT.is_active ))b
