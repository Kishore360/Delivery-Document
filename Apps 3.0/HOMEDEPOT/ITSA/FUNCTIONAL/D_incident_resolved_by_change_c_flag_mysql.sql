SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message
 FROM homedepot_mdsdb.incident_final SRC 
 JOIN homedepot_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE CASE WHEN SRC.u_resolved_by_change ='Yes' THEN 'Y' ELSE 'N' END <> TRGT.resolved_by_change_c_flag