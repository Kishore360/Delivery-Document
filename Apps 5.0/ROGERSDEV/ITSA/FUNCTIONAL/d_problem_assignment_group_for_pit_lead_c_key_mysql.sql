SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_problem.assignment_group_for_pit_lead_c_key' ELSE 'SUCCESS' END as Message 
 FROM rogersdev_mdsdb.problem_final  SRC JOIN rogersdev_mdwdb.d_problem TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN rogersdev_mdwdb.d_internal_organization LKP ON ( concat( 'GROUP~' ,upper( SRC.u_assignment_group_for_pit_lead)) = LKP.row_id AND 
 SRC.sourceinstance = LKP.source_id ) WHERE 
 COALESCE(LKP.row_key,CASE WHEN SRC.u_assignment_group_for_pit_lead IS NULL THEN 0 else -1 end)<> (TRGT.assignment_group_for_pit_lead_c_key) 
