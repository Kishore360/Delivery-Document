
  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.this_change_modifies_the_ci_c_flag' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.change_request_final SRC 
 LEFT JOIN nypres_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN u_this_change_modifies_the_ci_ = 1 then 'Y' else 'N' END)<> (TRGT.this_change_modifies_the_ci_c_flag )
 
 