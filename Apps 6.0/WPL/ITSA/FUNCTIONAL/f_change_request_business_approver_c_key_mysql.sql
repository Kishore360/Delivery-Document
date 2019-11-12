SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 
'MDS to DWH data validation failed for f_change_request.business_approver_c_key' ELSE 'SUCCESS' END as Message 
FROM wpl_mdsdb.change_request_final  SRC JOIN wpl_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN wpl_mdwdb.d_internal_organization LKP ON ( concat( 'GROUP~' ,upper( SRC.u_business_approver)) = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_business_approver IS NULL THEN 0 else -1 end)<> (TRGT.business_approver_c_key) 
and SRC.cdctype='X'
