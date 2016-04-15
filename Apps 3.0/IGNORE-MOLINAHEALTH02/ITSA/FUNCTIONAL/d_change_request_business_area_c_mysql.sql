 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.change_request_final SRC 
 LEFT JOIN molinahealth02_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN molinahealth_mdsdb.u_change_approver_final LKP 
 on SRC.u_business_area = LKP.sys_id 
 WHERE COALESCE(LKP.u_business_area,'UNSPECIFIED')<> (TRGT.business_area_c)