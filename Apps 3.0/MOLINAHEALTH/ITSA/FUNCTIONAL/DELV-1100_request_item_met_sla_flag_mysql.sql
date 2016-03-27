SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.met_sla_flag' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.sc_req_item_final SRC 
 LEFT JOIN molinahealth_mdwdb.d_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN open_to_class_duration>604800 then 'N' else 'Y' end)<> (TRGT.met_sla_flag )

 
