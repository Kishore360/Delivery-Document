SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_by_key' ELSE 'SUCCESS' END as Message
FROM homedepot_mdsdb.change_request_final SRC
LEFT JOIN homedepot_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN homedepot_mdsdb.u_idp_fms_final LKP 
 ON LKP.sys_id = SRC.u_fms_number AND LKP.sourceinstance= SRC.sourceinstance
where LKP.u_sap_id_1 <> (TRGT.fms_number_c) ;