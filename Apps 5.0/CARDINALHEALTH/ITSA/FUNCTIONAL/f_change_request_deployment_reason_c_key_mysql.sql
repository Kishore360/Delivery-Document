SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.change_request_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_lov LKP
 on LKP.row_id = COALESCE( CONCAT('DEPLOYMENT_REASON_C','~','CHANGE_REQUEST','~','~','~',UPPER(SRC.u_deployment_reason )),'UNSPECIFIED') and LKP.source_id = SRC.sourceinstance
 LEFT JOIN cardinalhealth_mdwdb.f_change_request TRGT 
  
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key , CASE WHEN SRC.u_deployment_reason is null then 0 else -1 END) <> TRGT.deployment_reason_c_key ;
 