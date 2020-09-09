SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.u_explanation_capacity_c' ELSE 'SUCCESS' END as Message
 FROM fidelity_mdsdb.change_request_final SRC 
 LEFT JOIN fidelity_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id and TRGT.soft_deleted_flag = 'N' )
 WHERE SRC.u_explanation_capacity<> COALESCE(TRGT.u_explanation_capacity_c);